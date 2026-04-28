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

class _NameAssigner {
  _NameAssigner(this._names);

  final Map<JsonPointer, String> _names;
  final Set<JsonPointer> _visited = {};

  void visit(ResolvedSpec spec) {
    for (final path in spec.paths) {
      for (final op in path.operations) {
        for (final param in op.parameters) {
          _visitSchema(param.schema);
        }
        final reqBody = op.requestBody;
        if (reqBody != null) _visitSchema(reqBody.schema);
        for (final response in op.responses) {
          _visitSchema(response.content);
        }
        for (final rangeResp in op.rangeResponses) {
          _visitSchema(rangeResp.content);
        }
        final defaultResp = op.defaultResponse;
        if (defaultResp != null) _visitSchema(defaultResp.content);
      }
    }
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
