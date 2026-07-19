import 'dart:collection';

import 'package:path/path.dart' as p;
import 'package:space_gen/src/loader.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parse/visitor.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/string.dart';

/// Assemble the complete input for resolution: load [rootUrl], parse it, and
/// transitively load + parse every document reachable through an external
/// `$ref`, returning the parsed root plus a [RefRegistry] populated with
/// every referenceable component.
///
/// Assembly is the phase that spans IO and parsing: it awaits [Cache] loads
/// and calls the *synchronous* parser. The dependency runs one way —
/// assemble calls load and parse; parse never reaches back up into assemble
/// (so parsing a single document stays synchronous and offline).
Future<(OpenApi, RefRegistry)> assembleSpec(Uri rootUrl, Cache cache) async {
  final rootJson = await cache.load(rootUrl);
  final root = parseOpenApi(rootJson);
  // Index the root spec's own components first, then pull in externals. Has
  // to happen before resolveSpec so refs into other files don't fall off
  // the edge.
  final refRegistry = RefRegistry();
  SpecWalker(RegistryBuilder(rootUrl, refRegistry)).walkRoot(root);
  await _loadExternalRefs(
    rootSpec: root,
    rootSpecUrl: rootUrl,
    cache: cache,
    refRegistry: refRegistry,
  );
  return (root, refRegistry);
}

/// Visitor that collects every [Ref] it sees. Used to find the full set of
/// references in a spec (root or external) so assembly can pull in every
/// externally-ref'd document before resolution runs.
class _RefCollector extends Visitor {
  _RefCollector(this._refs);

  final Set<Ref<Parseable>> _refs;

  @override
  void visitRefOr<T extends Parseable>(RefOr<T> refOr) {
    final ref = refOr.ref;
    if (ref != null) _refs.add(ref);
  }
}

Set<Ref<Parseable>> _collectRefsFromRoot(OpenApi root) {
  final refs = <Ref<Parseable>>{};
  SpecWalker(_RefCollector(refs)).walkRoot(root);
  return refs;
}

Set<Ref<Parseable>> _collectRefsFromComponents(Components components) {
  final refs = <Ref<Parseable>>{};
  SpecWalker(_RefCollector(refs)).walkComponents(components);
  return refs;
}

/// Load every document reachable from [rootSpec] through external `$ref`
/// and register its components in [refRegistry].
///
/// Uses the full parser (not a raw JSON scan) to find refs: a scan would
/// false-positive on `$ref` strings that sit inside `example:` payloads
/// or unsupported extension fields. The parser only surfaces refs in
/// spec-meaningful positions.
///
/// Two document shapes are handled. An OpenAPI-shaped components library is
/// indexed whole by pointer. A split-spec document (redocly/stoplight
/// style, no `components:` section) has each referenced JSON-pointer target
/// parsed as the type its referencing site demands and registered under its
/// full URI.
Future<void> _loadExternalRefs({
  required OpenApi rootSpec,
  required Uri rootSpecUrl,
  required Cache cache,
  required RefRegistry refRegistry,
}) async {
  // Documents indexed whole (the root spec, plus any external
  // components-library document): a ref into one is already satisfied, so
  // it is skipped by document URI. Split-spec targets, by contrast, are
  // registered one JSON-pointer at a time and deduped by full URI below.
  final fullyIndexedDocs = <Uri>{rootSpecUrl};
  final processedTargets = <Uri>{};
  // Each work item carries the URL of the doc containing the ref, so the
  // ref's (possibly relative) URI resolves against the right base.
  final workItems = Queue<(Uri sourceDoc, Ref<Parseable> ref)>();

  void enqueue(Uri sourceDoc, Iterable<Ref<Parseable>> refs) {
    for (final ref in refs) {
      workItems.add((sourceDoc, ref));
    }
  }

  enqueue(rootSpecUrl, _collectRefsFromRoot(rootSpec));

  while (workItems.isNotEmpty) {
    final (sourceDoc, ref) = workItems.removeFirst();
    final resolved = sourceDoc.resolveUri(ref.uri);
    final docUri = resolved.removeFragment();
    if (fullyIndexedDocs.contains(docUri)) continue;

    final doc = await cache.load(docUri);
    final componentsJson = doc['components'];
    if (componentsJson is Map<String, dynamic>) {
      // OpenAPI-shaped components library: index every component by its
      // in-document pointer (`docUri#/components/schemas/Foo`).
      fullyIndexedDocs.add(docUri);
      final componentsContext = MapContext(
        pointerParts: ['components'],
        snakeNameStack: const [],
        json: componentsJson,
      );
      final components = parseComponents(componentsContext);

      SpecWalker(
        RegistryBuilder(docUri, refRegistry),
      ).walkComponents(components);

      enqueue(docUri, _collectRefsFromComponents(components));
    } else {
      // Split-spec convention (redocly/stoplight style): the document has
      // no `components:` section; the `$ref`'s fragment is a JSON-pointer
      // into it (empty fragment = the whole-file root). The pointed-at
      // node is a lone component whose type comes from the referencing
      // site. Register it under its full URI — exactly the key the ref
      // resolves to — and chase its own external refs.
      if (!processedTargets.add(resolved)) continue;
      final targetJson = _resolveJsonPointer(doc, resolved);
      final refOr = _parseExternalTarget(ref, resolved, targetJson);
      final object = refOr.object;
      if (object == null) {
        // The target is itself only a `$ref`; alias this URI to it and
        // chase the inner ref so the object it names gets registered.
        final inner = refOr.ref!;
        refRegistry.registerAlias(resolved, docUri.resolveUri(inner.uri));
        enqueue(docUri, [inner]);
      } else {
        refRegistry.register(resolved, object);
        final nestedRefs = <Ref<Parseable>>{};
        SpecWalker(_RefCollector(nestedRefs)).walkRefOr(refOr);
        enqueue(docUri, nestedRefs);
      }
    }
  }
}

/// Navigate the JSON-pointer fragment of [target] into [doc] and return the
/// pointed-at object. An empty fragment yields the document root.
Map<String, dynamic> _resolveJsonPointer(
  Map<String, dynamic> doc,
  Uri target,
) {
  dynamic current = doc;
  for (final rawPart in target.fragment.split('/')) {
    if (rawPart.isEmpty) continue;
    // RFC 6901 unescaping: `~1` → `/` before `~0` → `~`.
    final part = rawPart.replaceAll('~1', '/').replaceAll('~0', '~');
    if (current is! Map<String, dynamic> || !current.containsKey(part)) {
      throw FormatException(
        'External ref $target: no `$part` at that JSON-pointer path.',
      );
    }
    current = current[part];
  }
  if (current is! Map<String, dynamic>) {
    throw FormatException('External ref $target does not point at an object.');
  }
  return current;
}

/// Parse an external split-spec [target] JSON as the component type its
/// referencing site [ref] demands. Keyed in the registry by [target]'s full
/// URI, so the parse pointer only has to be globally unique (the URI is) and
/// the snake name only has to read well.
RefOr<Parseable> _parseExternalTarget(
  Ref<Parseable> ref,
  Uri target,
  Map<String, dynamic> targetJson,
) {
  // A fragment names the node (`.../tags.yaml#/properties/brands` →
  // `brands`); a bare file is named by its basename.
  final fragment = target.fragment;
  final rawName = fragment.isEmpty
      ? p.basenameWithoutExtension(target.path)
      : fragment
            .split('/')
            .lastWhere(
              (s) => s.isNotEmpty,
              orElse: () => p.basenameWithoutExtension(target.path),
            );
  final context = MapContext(
    // A unique, opaque identity for the resolver's recursion stack and the
    // name allocator; never emitted, so the full URI is fine.
    pointerParts: [target.toString()],
    snakeNameStack: [toSnakeCase(rawName)],
    json: targetJson,
  );
  final type = ref.type;
  if (type == Schema) return parseSchemaOrRef(context);
  if (type == Response) return parseResponseOrRef(context);
  if (type == Parameter) return parseParameterOrRef(context);
  if (type == RequestBody) return parseRequestBodyOrRef(context);
  if (type == Header) return parseHeaderOrRef(context);
  throw FormatException(
    'External ref target $target is a whole-file component of unsupported '
    'type $type; space_gen supports whole-file schemas, responses, '
    'parameters, request bodies, and headers.',
  );
}
