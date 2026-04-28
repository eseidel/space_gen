/// Assigns Dart class names to every named entity in the resolved
/// tree. The renderer reads these names instead of computing them
/// from `common.snakeName` per schema.
///
/// Why a separate phase: today, names get decided in three layers
/// (parser synthesizes inline-schema names, resolver suffixes
/// collisions with `_1`, renderer composes wrappers from parent +
/// tag). Each layer makes a local decision with only partial
/// information, so we get artifacts like
/// `ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0`. A
/// single pass with the full set of named entities in view can pick
/// shorter, less-collision-prone names.
///
/// Each entity submits a *preference list* — best (shortest /
/// most-descriptive) first, longest-but-guaranteed-unique last — and
/// the [NameAllocator] runs a fixpoint: when two entities propose the
/// same name, both advance to their next preference; when an entity
/// reaches the end of its list and still conflicts, a numeric suffix
/// disambiguates. Today every caller passes a single-element list
/// (the same name the old algorithm produced), so generated output
/// is unchanged. Multi-tier preferences are wired in for the
/// synthesized op-response name to exercise the fixpoint, and
/// future PRs can opt other entities into shorter forms by widening
/// their preference lists.
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

/// Walks the resolved tree, builds a preference list for each named
/// entity, and runs an [NameAllocator] fixpoint to settle on final
/// Dart class names. See the library doc for the algorithm; today
/// most callers pass single-element preference lists, so the output
/// matches the prior `camelFromSnake(common.snakeName)` algorithm.
AssignedNames assignNames(ResolvedSpec spec) =>
    (_NameAssigner()..visit(spec)).build();

/// Assigns names for a single resolved operation. Used by test
/// helpers (`renderTestOperation`) that render an operation in
/// isolation, without a surrounding spec.
AssignedNames assignNamesForOperation(ResolvedOperation op) =>
    (_NameAssigner()..visitOperation(op)).build();

/// Assigns names reachable from a single resolved schema. Used by
/// test helpers (`renderTestSchema`, `renderTestSchemas`) that
/// render schemas in isolation, without a surrounding spec.
AssignedNames assignNamesForSchema(ResolvedSchema schema) =>
    (_NameAssigner()..visitSchema(schema)).build();

class _NameAssigner {
  _NameAssigner();

  final NameAllocator _allocator = NameAllocator();
  final Set<JsonPointer> _visited = {};
  // Schema collections seen in phase 1, processed in phase 2 once
  // their variants' Dart names have been resolved.
  final List<ResolvedSchemaCollection> _collectionsForWrappers = [];

  /// Run the allocator's fixpoint and return the final pointer →
  /// Dart name map. Two phases: phase 1 resolves schema and synthesized
  /// op-response names; phase 2 reads those resolved names to compose
  /// wrapper-subclass preferences and resolves them. Wrappers can't
  /// land in phase 1 because their preferences depend on phase 1's
  /// output.
  AssignedNames build() {
    _allocator.resolve();
    for (final collection in _collectionsForWrappers) {
      _claimWrapperNames(collection);
    }
    _allocator.resolve();
    return AssignedNames(Map.of(_allocator.assigned));
  }

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
    // resolved schema. We claim its name on the operation's pointer
    // (no schema otherwise claims it) so render reads the name
    // through the same map. Most operations don't trigger the
    // synthesized wrapper; claiming unconditionally is cheap and
    // keeps the lookup unconditional on the render side.
    //
    // Multi-tier preferences exercise the allocator's fixpoint on a
    // real production code path: `<op>Response` is the natural
    // first preference, with `<op>Response2`, `<op>Response3`, ...
    // as fallbacks if a top-level schema with that snake name claims
    // the slot first. Today neither github nor gen_tests/ has such a
    // collision, so the first preference always wins; the platform
    // is wired regardless so future renames pay no plumbing cost.
    final base = camelFromSnake('${op.snakeName}_response');
    _allocator.claim(op.pointer, [
      base,
      for (var i = 2; i <= 4; i++) '$base$i',
    ]);
  }

  void visitSchema(ResolvedSchema schema) => _visitSchema(schema);

  /// Phase-2 wrapper-subclass name claims. Reads the resolved variant
  /// names produced by phase 1 and submits one claim per dispatch-
  /// emitted wrapper. Variant identity is by index in
  /// [collection]`.schemas` — matches `AssignedNames.wrapperPointer`.
  void _claimWrapperNames(ResolvedSchemaCollection collection) {
    final decision = decideDispatch(collection);
    if (decision is NoDispatch) return;
    final parentName = _allocator.assigned[collection.pointer];
    if (parentName == null) return;
    for (var i = 0; i < collection.schemas.length; i++) {
      final variant = collection.schemas[i];
      final wrapperName = _wrapperNameFor(parentName, variant, decision, i);
      if (wrapperName == null) continue;
      _allocator.claim(AssignedNames.wrapperPointer(collection.pointer, i), [
        wrapperName,
      ]);
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
  /// the resolved name for newtypes; returns the structural Dart
  /// type for non-newtype primitives. Returns null when neither
  /// applies (uncovered case — caller decides whether to skip).
  /// Called from phase 2; reads phase-1's resolved names.
  String? _typeNameOf(ResolvedSchema schema) {
    final assigned = _allocator.assigned[schema.pointer];
    if (assigned != null) return assigned;
    return switch (schema) {
      ResolvedRecursiveRef() => _allocator.assigned[schema.targetPointer],
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
      // own resolved name (they're always newtypes; the tag IS the
      // class name). AllOf collapses into a synthetic merged
      // `RenderObject` at render time, so it's the same case here —
      // the AllOf's own resolved name.
      ResolvedObject() ||
      ResolvedEnum() ||
      ResolvedEmptyObject() ||
      ResolvedAllOf() => _allocator.assigned[variant.pointer],
      // Recursive refs tag with the target's resolved name.
      ResolvedRecursiveRef() => _allocator.assigned[variant.targetPointer],
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
      // Single-element preference list for now — today's behavior.
      // Future PRs can widen this (e.g., title-derived shorter forms
      // ahead of the parser-synthesized name).
      _allocator.claim(schema.pointer, [camelFromSnake(schema.snakeName)]);
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
        // Defer wrapper-name claims to phase 2 — they need the
        // resolved variant names. AllOf gets `NoDispatch` from
        // [decideDispatch] (it collapses to a synthetic object), so
        // no wrappers will actually be claimed for it; queueing it
        // is harmless and keeps the gate in one place.
        _collectionsForWrappers.add(collection);
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

/// Collision-aware Dart name allocator. Each entity submits a
/// preference list (best first, longest/safest last) via [claim];
/// [resolve] runs a fixpoint that advances colliding entities to
/// their next preference, then suffixes any remaining ties with a
/// numeric tail (`Foo`, `Foo2`, `Foo3`, …).
///
/// The fixpoint is order-independent: same set of claims → same
/// assignments regardless of insertion order. This matters because
/// the naming pass walks the spec in declaration order, but a stable
/// algorithm means future visit-order tweaks can't silently shuffle
/// names.
///
/// [resolve] can be called multiple times — each call assigns the
/// claims pending at the time of the call. Names assigned in earlier
/// `resolve()` cycles are treated as taken: subsequent claims work
/// around them. The naming pass uses two cycles (phase 1: schemas +
/// op-response synthetics; phase 2: wrappers, which need phase-1
/// resolved names to compose their preferences).
///
/// Public so unit tests can drive it directly with hand-built claims;
/// most callers should go through [_NameAssigner].
class NameAllocator {
  NameAllocator();

  final Map<JsonPointer, String> _assigned = {};
  final Set<String> _takenNames = {};
  final Map<JsonPointer, List<String>> _pending = {};

  /// Resolved (pointer → name) assignments from prior [resolve] calls.
  /// Read-only view; new assignments land here when the next
  /// [resolve] runs.
  Map<JsonPointer, String> get assigned => Map.unmodifiable(_assigned);

  /// Submit a claim. [preferences] must be non-empty and ordered
  /// best-first. A pointer that already has a resolved name (from a
  /// prior [resolve]) silently ignores the claim — re-visits during
  /// recursion are common and benign.
  void claim(JsonPointer pointer, List<String> preferences) {
    if (preferences.isEmpty) {
      throw ArgumentError('Preferences cannot be empty: $pointer');
    }
    if (_assigned.containsKey(pointer)) return;
    _pending[pointer] = preferences;
  }

  /// Run the fixpoint over pending claims, settling each on its
  /// best non-conflicting preference. Already-assigned names from
  /// prior [resolve] cycles are treated as taken and won't be
  /// reused. Empties the pending queue.
  void resolve() {
    if (_pending.isEmpty) return;

    final pending = Map.of(_pending);
    _pending.clear();

    // Per-entity tier index, advanced when its current proposal
    // conflicts with another pending claimant or with an already-
    // assigned name.
    final tiers = <JsonPointer, int>{
      for (final p in pending.keys) p: 0,
    };

    while (true) {
      final proposals = <String, List<JsonPointer>>{};
      for (final p in pending.keys) {
        proposals.putIfAbsent(pending[p]![tiers[p]!], () => []).add(p);
      }
      var changed = false;
      for (final entry in proposals.entries) {
        final group = entry.value;
        final inConflict = group.length > 1 || _takenNames.contains(entry.key);
        if (!inConflict) continue;
        for (final p in group) {
          final prefs = pending[p]!;
          if (tiers[p]! < prefs.length - 1) {
            tiers[p] = tiers[p]! + 1;
            changed = true;
          }
        }
      }
      if (!changed) break;
    }

    // Finalize: each pending claim takes its current-tier name.
    // Any remaining ties (multiple pending claimants stuck on the
    // same last-tier name, or a pending claim whose final preference
    // matches an already-assigned name) get a numeric suffix. Order
    // by pointer string so the suffix assignment is deterministic.
    final byName = <String, List<JsonPointer>>{};
    for (final p in pending.keys) {
      byName.putIfAbsent(pending[p]![tiers[p]!], () => []).add(p);
    }
    for (final entry in byName.entries) {
      final base = entry.key;
      final group = entry.value
        ..sort((a, b) => a.toString().compareTo(b.toString()));
      var baseTaken = _takenNames.contains(base);
      for (final p in group) {
        final name = baseTaken ? _disambiguate(base) : base;
        _assigned[p] = name;
        _takenNames.add(name);
        baseTaken = true;
      }
    }
  }

  String _disambiguate(String base) {
    var i = 2;
    while (_takenNames.contains('$base$i')) {
      i++;
    }
    return '$base$i';
  }
}
