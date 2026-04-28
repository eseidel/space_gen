/// Assigns Dart class names to every named entity in the resolved
/// tree. The renderer reads these names instead of computing them
/// from `common.snakeName` per schema.
///
/// Why a separate phase: today, names get decided in three layers
/// (parser synthesizes inline-schema names, resolver suffixes
/// collisions with `_1`, renderer composes wrappers from parent +
/// tag). Each layer makes a local decision with only partial
/// information, so we get artifacts like
/// `ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0` and
/// `RepositoryRulesetConditions1`. A single pass with the full set
/// of named entities in view can pick shorter, less-collision-prone
/// names. This file is the first step — it consolidates the lookup
/// without changing the algorithm. A future pass can swap the
/// algorithm to shortest-unique-with-fallback.
///
/// Resolver stays Dart-blind: this pass is the only place that
/// knows about Dart class names. The resolver produces snake-case
/// identifiers (still parser-level); naming converts them to
/// CamelCase Dart class names and resolves collisions.
library;

import 'package:meta/meta.dart';
import 'package:space_gen/src/dispatch.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';

/// The set of Dart class names assigned by the naming pass, keyed by
/// each named entity's identifier (typically its [JsonPointer]).
///
/// The renderer consults this map for every typed reference; its own
/// `typeName` getters are thin lookups now, not computations.
@immutable
class AssignedNames {
  const AssignedNames(this._byPointer);

  final Map<JsonPointer, String> _byPointer;

  /// Looks up the Dart class name for [pointer]. Returns null when
  /// the entity at [pointer] doesn't have a name (non-newtype
  /// schemas, refs, etc.).
  String? maybeGet(JsonPointer pointer) => _byPointer[pointer];

  /// Looks up the Dart class name for [pointer]. Throws when the
  /// entity isn't named — calls that hit this path are bugs in the
  /// naming pass (an entity that should have been enumerated wasn't).
  String operator [](JsonPointer pointer) {
    final name = _byPointer[pointer];
    if (name == null) {
      throw StateError(
        'No name assigned for $pointer — naming pass missed this entity.',
      );
    }
    return name;
  }

  /// Empty map — for tests that build render schemas directly without
  /// going through the full pipeline. Schemas constructed this way
  /// fall back to their `common.snakeName`-derived computation.
  static const empty = AssignedNames({});

  /// Synthesized pointer for a wrapper subclass of a sealed-class
  /// dispatch. The wrapper itself isn't a [ResolvedSchema], so it has
  /// no pointer of its own; we mint one from the parent oneOf's
  /// pointer + variant index. The render side computes the same key
  /// when it needs the wrapper's class name.
  static JsonPointer wrapperPointer(
    JsonPointer parentPointer,
    int variantIndex,
  ) => parentPointer.add('_wrapper').add('$variantIndex');

  /// All assigned (pointer, name) pairs. Iteration order matches the
  /// underlying map; use only for debugging / tests / metrics.
  Iterable<MapEntry<JsonPointer, String>> get entries => _byPointer.entries;

  /// Returns an unmodifiable view of the underlying map. Test-only.
  Map<JsonPointer, String> toMap() => Map.unmodifiable(_byPointer);
}

/// Walks the resolved tree and assigns a Dart class name to every
/// schema that creates a new type. Today's algorithm: for each
/// `createsNewType: true` schema, the name is
/// `camelFromSnake(common.snakeName)`. The resolver has already
/// applied any `_1`-style snake-name collision suffixes upstream, so
/// this pass produces the same output the renderer's existing
/// `typeName` getters would compute on their own.
///
/// The eventual quality win is changing this algorithm to
/// shortest-unique-with-fallback (PR 3+). This PR just consolidates
/// the lookup so one place owns the answer.
AssignedNames assignNames(ResolvedSpec spec) {
  final names = <JsonPointer, String>{};
  _NameAssigner(names).visit(spec);
  return AssignedNames(names);
}

/// Assigns names for a single resolved operation. Used by test
/// helpers (`renderTestOperation`) that render an operation in
/// isolation, without a surrounding spec.
AssignedNames assignNamesForOperation(ResolvedOperation op) {
  final names = <JsonPointer, String>{};
  _NameAssigner(names).visitOperation(op);
  return AssignedNames(names);
}

/// Assigns names reachable from a single resolved schema. Used by
/// test helpers (`renderTestSchema`, `renderTestSchemas`) that
/// render schemas in isolation, without a surrounding spec.
AssignedNames assignNamesForSchema(ResolvedSchema schema) {
  final names = <JsonPointer, String>{};
  _NameAssigner(names).visitSchema(schema);
  return AssignedNames(names);
}

class _NameAssigner {
  _NameAssigner(this._names);

  final Map<JsonPointer, String> _names;
  final Set<JsonPointer> _visited = {};

  void visit(ResolvedSpec spec) {
    for (final path in spec.paths) {
      for (final op in path.operations) {
        visitOperation(op);
      }
    }
  }

  void visitOperation(ResolvedOperation op) {
    for (final param in op.parameters) {
      visitSchema(param.schema);
    }
    final reqBody = op.requestBody;
    if (reqBody != null) visitSchema(reqBody.schema);
    for (final response in op.responses) {
      visitSchema(response.content);
    }
    for (final rangeResp in op.rangeResponses) {
      visitSchema(rangeResp.content);
    }
    final defaultResp = op.defaultResponse;
    if (defaultResp != null) visitSchema(defaultResp.content);
    // Operation-level synthesized response wrapper: when the spec
    // mixes explicit 2xx codes with a 2XX range, the renderer
    // synthesizes a `RenderOneOf` that doesn't correspond to any
    // resolved schema. The naming pass assigns its name here
    // (keyed by the operation's pointer, which no schema otherwise
    // claims) so render reads the name through the same map. Most
    // operations don't trigger the synthesized wrapper; assigning
    // unconditionally is cheap and keeps the lookup unconditional
    // on the render side.
    _names[op.pointer] = camelFromSnake('${op.snakeName}_response');
  }

  void visitSchema(ResolvedSchema schema) => _visitSchema(schema);

  /// Once every variant of [collection] has its own assigned name,
  /// enumerate the wrapper subclasses the dispatch will emit and
  /// assign each its name. Stored under [AssignedNames.wrapperPointer]
  /// so the render side can look them up using the parent pointer +
  /// variant index, the same way it already maps variants between
  /// `source.schemas[i]` and the parallel `RenderOneOf.schemas[i]`.
  void _assignWrapperNames(ResolvedSchemaCollection collection) {
    final decision = decideDispatch(collection);
    if (decision is NoDispatch) return;
    final parentName = _names[collection.pointer];
    if (parentName == null) return;
    for (var i = 0; i < collection.schemas.length; i++) {
      final variant = collection.schemas[i];
      final wrapperName = _wrapperNameFor(parentName, variant, decision, i);
      if (wrapperName == null) continue;
      _names[AssignedNames.wrapperPointer(collection.pointer, i)] = wrapperName;
    }
  }

  /// Computes the Dart class name for one wrapper subclass. Mirrors
  /// the render-side `wrapperTypeName` / array-element logic, but
  /// reads variant names from `_names` instead of the variant's own
  /// `typeName` getter. Returns null for the rare case where the
  /// dispatch doesn't actually emit a wrapper for this variant
  /// (caller skips the assignment).
  String? _wrapperNameFor(
    String parentName,
    ResolvedSchema variant,
    DispatchDecision decision,
    int variantIndex,
  ) {
    if (decision is PredicateDispatch &&
        decision.kind == PredicateDispatchKind.arrayElement) {
      // Array-element wrappers splice the items type so sibling
      // arrays don't collide on the shared `wrapperTag = 'List'`.
      // `_pickArrayElementMode` only fires when every variant is a
      // `ResolvedArray`, so the cast is safe.
      final array = variant as ResolvedArray;
      final itemName = _typeNameOf(array.items);
      if (itemName == null) return null;
      return '$parentName${itemName}List';
    }
    final tag = _wrapperTagOf(variant);
    if (tag == null) return null;
    // For object-like variants, the tag is the variant's own typeName.
    // When the variant was synthesized inline by the parser
    // (`<parent>OneOf<i>`), that name already contains the parent —
    // composing `<parent><tag>` then doubles the prefix
    // (`ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0`).
    // Fall back to a position-based name to keep wrappers readable.
    // Top-level $ref variants (e.g. `PrivateUser` under
    // `UsersGetAuthenticated200Response`) don't trip this and keep
    // their descriptive `<parent><variant>` form.
    if (tag.startsWith(parentName)) {
      return '${parentName}Variant$variantIndex';
    }
    return '$parentName$tag';
  }

  /// The Dart type name for a schema as it would appear at a use
  /// site. Mirrors the render-side `typeName` getter chain: looks up
  /// the assigned name for newtypes; returns the structural Dart
  /// type for non-newtype primitives. Returns null when neither
  /// applies (uncovered case — caller decides whether to skip).
  String? _typeNameOf(ResolvedSchema schema) {
    final assigned = _names[schema.pointer];
    if (assigned != null) return assigned;
    return switch (schema) {
      ResolvedRecursiveRef() => _names[schema.targetPointer],
      ResolvedString() => schema.createsNewType ? null : 'String',
      ResolvedInteger() => schema.createsNewType ? null : 'int',
      ResolvedNumber() => schema.createsNewType ? null : 'double',
      _ => null,
    };
  }

  /// The wrapper-tag string used to compose a wrapper class name as
  /// `<parent><tag>` for non-array-element dispatches. Mirrors each
  /// `RenderSchema` subclass's `wrapperTag` getter exactly — see
  /// those getters for why each case looks the way it does. Returns
  /// null when the variant has no wrapperTag (e.g., a primitive
  /// newtype that gates shape-dispatch out).
  String? _wrapperTagOf(ResolvedSchema variant) {
    return switch (variant) {
      // Object / enum / empty-object variants tag with the variant's
      // own assigned name (they're always newtypes; the tag IS the
      // class name). AllOf collapses into a synthetic merged
      // `RenderObject` at render time, so it's the same case here —
      // the AllOf's own assigned name.
      ResolvedObject() ||
      ResolvedEnum() ||
      ResolvedEmptyObject() ||
      ResolvedAllOf() => _names[variant.pointer],
      // Recursive refs tag with the target's assigned name.
      ResolvedRecursiveRef() => _names[variant.targetPointer],
      // Primitives: null when newtype (no shape-dispatch
      // participation), else the structural Dart type name.
      ResolvedString() => variant.createsNewType ? null : 'String',
      ResolvedInteger() => variant.createsNewType ? null : 'Int',
      ResolvedNumber() => variant.createsNewType ? null : 'Num',
      ResolvedPod() =>
        !variant.createsNewType && variant.type == PodType.boolean
            ? 'Bool'
            : null,
      // Array / Map: always the structural literal, even when the
      // variant is a top-level newtype. The variant's `typeName` for
      // an array is `List<X>`; we can't splice that into a class
      // name, so the wrapper uses just `'List'`.
      ResolvedArray() => 'List',
      ResolvedMap() => 'Map',
      _ => null,
    };
  }

  void _visitSchema(ResolvedSchema schema) {
    if (!_visited.add(schema.pointer)) return;
    if (schema.createsNewType) {
      _names[schema.pointer] = camelFromSnake(schema.snakeName);
    }
    // Recurse into structural children so inline newtypes get named.
    switch (schema) {
      case ResolvedObject():
        for (final prop in schema.properties.values) {
          _visitSchema(prop);
        }
        final extraProps = schema.additionalProperties;
        if (extraProps != null) _visitSchema(extraProps);
      case ResolvedArray():
        _visitSchema(schema.items);
      case ResolvedMap():
        _visitSchema(schema.valueSchema);
        final keyEnum = schema.keySchema;
        if (keyEnum != null) _visitSchema(keyEnum);
      case ResolvedOneOf():
      case ResolvedAnyOf():
      case ResolvedAllOf():
        final collection = schema as ResolvedSchemaCollection;
        for (final variant in collection.schemas) {
          _visitSchema(variant);
        }
        // After variants are named, enumerate any wrapper subclass
        // names. AllOf gets `NoDispatch` from [decideDispatch] (it
        // collapses to a synthetic object) and the helper is a
        // no-op there, so no gate needed.
        _assignWrapperNames(collection);
      case ResolvedString():
      case ResolvedInteger():
      case ResolvedNumber():
      case ResolvedPod():
      case ResolvedEnum():
      case ResolvedEmptyObject():
      case ResolvedRecursiveRef():
      case ResolvedVoid():
      case ResolvedBinary():
      case ResolvedNull():
      case ResolvedUnknown():
        // Leaf — no inline children to visit.
        break;
    }
  }
}
