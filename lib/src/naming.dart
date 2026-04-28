/// Assigns names to every named entity in the resolved tree. The
/// renderer reads these names instead of computing them from
/// `common.snakeName` per schema.
///
/// Why a separate phase: names get decided in multiple layers (parser
/// synthesizes inline-schema names, resolver suffixes collisions with
/// `_1`, renderer composes wrappers from parent + tag). Each layer
/// makes a local decision with only partial information, so we get
/// artifacts like `ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0`
/// or a class whose Dart name says one thing while its file name says
/// another. A single pass with the full set of named entities in view
/// can pick shorter, less-collision-prone names — and pair the file
/// name with the class name automatically.
///
/// Each entity submits a *preference list* of snake names — best
/// (shortest / most-descriptive) first, longest-but-guaranteed-unique
/// last — and the [NameAllocator] runs a fixpoint: when two entities
/// propose the same name, both advance to their next preference;
/// when an entity reaches the end of its list and still conflicts,
/// a numeric suffix disambiguates. The allocator stores snake names;
/// camel-case Dart class names are derived on read via
/// [camelFromSnake]. The pairing means a snake collision and a camel
/// collision are the same event — no parallel allocator needed.
///
/// Inline oneOf/anyOf variants whose spec carries a `title` opt into
/// a multi-tier preference list: the title's snake form first, the
/// parser-synthesized name (`<parent>_one_of_<i>`) as fallback. When
/// the title is unique that nicer name wins, file and class
/// together; otherwise we fall back gracefully. Top-level component
/// schemas, op responses, and other entities keep single-element
/// lists — generated output for those is unchanged.
///
/// Resolver stays Dart-blind: this pass is the only place that
/// converts snake to camel. The resolver produces snake-case
/// identifiers (still parser-level); naming claims them, resolves
/// collisions, and exposes both forms via [AssignedNames].
library;

import 'package:meta/meta.dart';
import 'package:space_gen/src/dispatch.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';

/// Names assigned by the naming pass, keyed by each named entity's
/// identifier (typically its [JsonPointer]). Storage is snake-case
/// (so file names and class names share a single source of truth);
/// camel-case Dart class names are derived via [camelFromSnake] on
/// read.
@immutable
class AssignedNames {
  const AssignedNames(
    this._snakeByPointer, {
    this.smooshedParentSnakeByPointer = const {},
  });

  final Map<JsonPointer, String> _snakeByPointer;

  /// For variants the naming pass marked smooshable (today: inline
  /// `ResolvedObject` variants under predicate-required dispatch),
  /// maps the variant's pointer to the snake name of the sealed
  /// parent it should extend. The render layer reads this to decide
  /// whether to emit a separate wrapper subclass or have the variant
  /// class extend the sealed parent directly.
  final Map<JsonPointer, String> smooshedParentSnakeByPointer;

  /// Snake name of the sealed parent that [pointer]'s variant
  /// class should extend, or null when this variant isn't
  /// smooshed (the wrapper subclass is emitted normally).
  String? parentSealedSnakeFor(JsonPointer pointer) =>
      smooshedParentSnakeByPointer[pointer];

  /// Looks up the snake-case name for [pointer]. Used as a file
  /// basename. Returns null when the entity at [pointer] doesn't
  /// have a name (non-newtype schemas, refs, etc.).
  String? snakeFor(JsonPointer pointer) => _snakeByPointer[pointer];

  /// Looks up the camel-case Dart class name for [pointer]. Returns
  /// null when [pointer] isn't named.
  String? maybeGet(JsonPointer pointer) {
    final snake = _snakeByPointer[pointer];
    return snake == null ? null : camelFromSnake(snake);
  }

  /// Looks up the camel-case Dart class name for [pointer]. Throws
  /// when the entity isn't named — calls that hit this path are bugs
  /// in the naming pass (an entity that should have been enumerated
  /// wasn't).
  String operator [](JsonPointer pointer) {
    final name = maybeGet(pointer);
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

  /// All assigned (pointer, camel-name) pairs. Iteration order
  /// matches the underlying map; use only for debugging / tests /
  /// metrics.
  Iterable<MapEntry<JsonPointer, String>> get entries =>
      _snakeByPointer.entries.map(
        (e) => MapEntry(e.key, camelFromSnake(e.value)),
      );

  /// All assigned (pointer, snake-name) pairs. Same iteration order
  /// as [entries], but exposes the underlying snake form. Used by
  /// test helpers that need to reconstruct an [AssignedNames] across
  /// multiple resolved schemas without losing the snake key.
  Iterable<MapEntry<JsonPointer, String>> get snakeEntries =>
      _snakeByPointer.entries;

  /// Returns an unmodifiable view of the camel-name map. Test-only.
  Map<JsonPointer, String> toMap() => Map.unmodifiable({
    for (final e in _snakeByPointer.entries) e.key: camelFromSnake(e.value),
  });
}

/// Walks the resolved tree, builds a preference list for each named
/// entity, and runs an [NameAllocator] fixpoint to settle on final
/// Dart class names. See the library doc for the algorithm; today
/// most callers pass single-element preference lists, so the output
/// matches the prior `camelFromSnake(common.snakeName)` algorithm.
AssignedNames assignNames(ResolvedSpec spec) =>
    (_NameAssigner()..visit(spec)).finalize();

/// Assigns names for a single resolved operation. Used by test
/// helpers (`renderTestOperation`) that render an operation in
/// isolation, without a surrounding spec.
AssignedNames assignNamesForOperation(ResolvedOperation op) =>
    (_NameAssigner()..visitOperation(op)).finalize();

/// Assigns names reachable from a single resolved schema. Used by
/// test helpers (`renderTestSchema`, `renderTestSchemas`) that
/// render schemas in isolation, without a surrounding spec.
AssignedNames assignNamesForSchema(ResolvedSchema schema) =>
    (_NameAssigner()..visitSchema(schema)).finalize();

class _NameAssigner {
  _NameAssigner();

  final NameAllocator _allocator = NameAllocator();
  final Set<JsonPointer> _visited = {};
  // Schema collections seen in phase 1, processed in phase 2 once
  // their variants' Dart names have been resolved.
  final List<ResolvedSchemaCollection> _collectionsForWrappers = [];
  // Variant pointer → parent's snake name, populated during phase 2
  // for inline-exclusive object variants whose dispatch lets the
  // variant class extend the sealed parent directly (smoosh). Render
  // reads this through [AssignedNames.parentSealedSnakeFor] and emits
  // the variant with `extends <Parent>` instead of a wrapper subclass.
  final Map<JsonPointer, String> _smooshedParentSnake = {};

  /// Run the allocator over both phases and return the final
  /// pointer → Dart name map. The assigner is single-use; calling
  /// this a second time would re-resolve already-assigned names as
  /// no-ops and produce the same snapshot.
  AssignedNames finalize() {
    _resolvePhase1();
    _resolvePhase2();
    return AssignedNames(
      _allocator.snapshot(),
      smooshedParentSnakeByPointer: Map.unmodifiable(_smooshedParentSnake),
    );
  }

  /// Phase 1: schema names + the synthesized op-response name. These
  /// were claimed during the tree walk; resolve them so phase 2 can
  /// read final schema names when it composes wrapper preferences.
  void _resolvePhase1() {
    _allocator.resolve();
  }

  /// Phase 2: wrapper-subclass preferences depend on phase-1 names,
  /// so we claim them now (reading from the resolved phase-1
  /// snapshot) and then resolve again.
  void _resolvePhase2() {
    for (final collection in _collectionsForWrappers) {
      _claimWrapperNames(collection);
    }
    _allocator.resolve();
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
    // Single-tier preference list: if a real schema ever ends up
    // wanting `<op>Response`, the allocator's numeric-suffix
    // fallback handles disambiguation correctly. Multi-tier
    // alternatives are pointless here (every op has the same
    // shape of preference list, so they'd march through tiers in
    // lockstep and finalize at a *worse* name than single-tier
    // gives via the suffix path).
    _allocator.claim(op.pointer, ['${op.snakeName}_response']);
  }

  void visitSchema(ResolvedSchema schema) => _visitSchema(schema);

  /// Phase-2 wrapper-subclass name claims. Reads the resolved variant
  /// names produced by phase 1 and submits one claim per dispatch-
  /// emitted wrapper. Variant identity is by index in
  /// [collection]`.schemas` — matches `AssignedNames.wrapperPointer`.
  ///
  /// Smooshable variants (inline `ResolvedObject` under a
  /// dispatch where the variant class can extend the sealed parent
  /// directly — predicate-required for now) skip the wrapper claim
  /// entirely. Render reads the parent's snake name from
  /// [_smooshedParentSnake] and emits the variant class with
  /// `extends <Parent>` instead of generating a separate wrapper
  /// subclass + `value:` indirection.
  void _claimWrapperNames(ResolvedSchemaCollection collection) {
    final decision = decideDispatch(collection);
    if (decision is NoDispatch) return;
    final parentName = _allocator.lookup(collection.pointer);
    if (parentName == null) return;
    for (var i = 0; i < collection.schemas.length; i++) {
      final variant = collection.schemas[i];
      if (_isSmooshable(variant, decision)) {
        _smooshedParentSnake[variant.common.pointer] = parentName;
        continue;
      }
      final wrapperName = _wrapperNameFor(parentName, variant, decision, i);
      if (wrapperName == null) continue;
      _allocator.claim(AssignedNames.wrapperPointer(collection.pointer, i), [
        wrapperName,
      ]);
    }
  }

  /// True when [variant] should be rendered as a direct subclass of
  /// its sealed parent (no separate wrapper class + `value:` shim).
  /// Two parts: structural eligibility and render-layer support.
  bool _isSmooshable(ResolvedSchema variant, DispatchDecision decision) =>
      _isStructurallySmooshable(variant) && _dispatchEmitsSmooshed(decision);

  /// Whether [variant] *could* be a direct subclass of a sealed
  /// parent in idiomatic Dart. Holds when it's an inline (so
  /// exclusive to one parent by construction) `ResolvedObject` (so
  /// it has a class body to extend with). Independent of any
  /// dispatch — purely a structural property of the variant.
  bool _isStructurallySmooshable(ResolvedSchema variant) =>
      variant is ResolvedObject && _isInlineCollectionVariant(variant);

  /// Whether [decision]'s render-layer template can emit a smooshed
  /// variant — i.e. skip the wrapper subclass and emit
  /// `case … => Variant.fromJson(…)` directly. Other dispatch kinds
  /// fall through to today's wrapper-based rendering until their
  /// templates are taught to smoosh too. Expanding this is the
  /// smoosh PR train: predicate-required first (this PR), then
  /// discriminator, shape, hybrid Map sub-arms.
  bool _dispatchEmitsSmooshed(DispatchDecision decision) =>
      decision is PredicateDispatch &&
      decision.kind == PredicateDispatchKind.requiredField;

  /// Computes the snake-case wrapper-subclass name for one variant.
  /// Mirrors the render-side `wrapperTypeName` / array-element logic
  /// in snake space; the allocator stores snake and the camel form
  /// is derived later. Returns null for the rare case where the
  /// dispatch doesn't actually emit a wrapper for this variant
  /// (caller skips the assignment).
  String? _wrapperNameFor(
    String parentSnake,
    ResolvedSchema variant,
    DispatchDecision decision,
    int variantIndex,
  ) {
    if (decision is PredicateDispatch &&
        decision.kind == PredicateDispatchKind.arrayElement) {
      // Array-element wrappers splice the items type so sibling
      // arrays don't collide on the shared `list` wrapper tag.
      // `_pickArrayElementMode` only fires when every variant is a
      // `ResolvedArray`, so the cast is safe.
      final array = variant as ResolvedArray;
      final itemName = _typeNameOf(array.items);
      if (itemName == null) return null;
      return '${parentSnake}_${itemName}_list';
    }
    final tag = _wrapperTagOf(variant);
    if (tag == null) return null;
    // For object-like variants, the tag is the variant's own snake
    // name. When the variant was synthesized inline by the parser
    // (`<parent>_one_of_<i>`), that name already contains the parent —
    // composing `<parent>_<tag>` then doubles the prefix. Fall back
    // to a position-based name to keep wrappers readable. Top-level
    // $ref variants (e.g. `private_user` under `users_get_..._200_response`)
    // don't trip this and keep their descriptive `<parent>_<variant>`
    // form.
    if (tag.startsWith(parentSnake)) {
      return '${parentSnake}_variant_$variantIndex';
    }
    return '${parentSnake}_$tag';
  }

  /// Snake-case name for a schema at a use site. Mirrors
  /// [_wrapperTagOf] for the type-name slot: looks up the resolved
  /// snake name for newtypes; returns the structural snake form
  /// (e.g. `string`, `int`) for non-newtype primitives. Returns null
  /// when neither applies. Called from phase 2; reads phase-1's
  /// resolved names.
  String? _typeNameOf(ResolvedSchema schema) {
    final assigned = _allocator.lookup(schema.pointer);
    if (assigned != null) return assigned;
    return switch (schema) {
      ResolvedRecursiveRef() => _allocator.lookup(schema.targetPointer),
      ResolvedString() => schema.createsNewType ? null : 'string',
      ResolvedInteger() => schema.createsNewType ? null : 'int',
      ResolvedNumber() => schema.createsNewType ? null : 'double',
      _ => null,
    };
  }

  /// Snake-case wrapper tag composed into a wrapper class name as
  /// `<parent>_<tag>`. Returns null when the variant has no tag
  /// (e.g., a primitive newtype that gates shape-dispatch out).
  /// Snake forms here become the snake-form wrapper name; the camel
  /// derivation matches each `RenderSchema` subclass's `wrapperTag`
  /// getter exactly (`int` → `Int`, `string` → `String`, `list` →
  /// `List`, etc.).
  String? _wrapperTagOf(ResolvedSchema variant) {
    return switch (variant) {
      // Object / enum / empty-object variants tag with the variant's
      // own resolved snake name. AllOf collapses into a synthetic
      // merged `RenderObject` at render time, so it's the same case
      // here — the AllOf's own resolved name.
      ResolvedObject() ||
      ResolvedEnum() ||
      ResolvedEmptyObject() ||
      ResolvedAllOf() => _allocator.lookup(variant.pointer),
      // Recursive refs tag with the target's resolved snake name.
      ResolvedRecursiveRef() => _allocator.lookup(variant.targetPointer),
      // Primitives: null when newtype (no shape-dispatch
      // participation), else the structural snake form.
      ResolvedString() => variant.createsNewType ? null : 'string',
      ResolvedInteger() => variant.createsNewType ? null : 'int',
      ResolvedNumber() => variant.createsNewType ? null : 'num',
      ResolvedPod() =>
        !variant.createsNewType && variant.type == PodType.boolean
            ? 'Bool'
            : null,
      // Array / Map: always the structural literal, even when the
      // variant is a top-level newtype. The variant's `typeName` for
      // an array is `List<X>`; we can't splice that into a class
      // name, so the wrapper uses just `'list'` (`List` after
      // camelization).
      ResolvedArray() => 'list',
      ResolvedMap() => 'map',
      _ => null,
    };
  }

  /// Snake-case preference list for [schema]. Inline oneOf/anyOf
  /// variants whose spec carries a `title` get a multi-tier list:
  /// the title's snake form first (e.g., github's `org-ruleset-conditions`
  /// variant titled `repository_name_and_ref_name` shortens to
  /// that name and matching file basename), with the parser-
  /// synthesized fallback (`<parent>_one_of_<i>`) as the safety
  /// net. Other entities pass single-element lists.
  List<String> _preferencesFor(ResolvedSchema schema) {
    final fallback = schema.common.snakeName;
    if (!_isInlineCollectionVariant(schema)) return [fallback];
    final title = schema.common.title;
    if (title == null || title.isEmpty) return [fallback];
    final titleSnake = toSnakeCase(title);
    if (titleSnake.isEmpty || titleSnake == fallback) return [fallback];
    return [titleSnake, fallback];
  }

  /// True when [schema]'s pointer ends in `/oneOf/<i>` or
  /// `/anyOf/<i>` — i.e. it's an inline variant whose parser-
  /// synthesized snake name embeds the parent's name. These are the
  /// schemas where a `title` gives us a clearly better short form.
  bool _isInlineCollectionVariant(ResolvedSchema schema) {
    final parts = schema.common.pointer.parts;
    if (parts.length < 2) return false;
    final secondToLast = parts[parts.length - 2];
    return secondToLast == 'oneOf' || secondToLast == 'anyOf';
  }

  void _visitSchema(ResolvedSchema schema) {
    if (!_visited.add(schema.pointer)) return;
    if (schema.createsNewType) {
      _allocator.claim(schema.pointer, _preferencesFor(schema));
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

  /// O(1) lookup of the resolved name for [pointer]. Returns null
  /// when the pointer isn't yet assigned (no prior [resolve] cycle
  /// has settled it). Safe to call from hot paths — the naming
  /// pass's wrapper-name composition reads through this on every
  /// variant.
  String? lookup(JsonPointer pointer) => _assigned[pointer];

  /// Snapshot the resolved assignments as an unmodifiable map. Call
  /// once at the end of the naming pass; intermediate readers should
  /// use [lookup]. Returns a freshly-wrapped view each call, so
  /// don't call this in a loop.
  Map<JsonPointer, String> snapshot() => Map.unmodifiable(_assigned);

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
