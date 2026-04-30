/// Decides how a oneOf/anyOf renders its `fromJson` body. Operates on
/// the resolved tree only — no Dart names, no template contexts. The
/// renderer consumes a [DispatchDecision] alongside its own naming and
/// per-variant Dart-string production to build the actual mustache
/// context.
///
/// Splitting dispatch out of render is the precondition for a global
/// naming pass: that pass needs to know every wrapper subclass that
/// will be emitted (so it can hand each one a name), and the wrapper
/// set is determined entirely by these decisions.
library;

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/types.dart' show PodType;

/// Boolean test that picks one variant of a oneOf at runtime. Each
/// kind knows how to emit its own `if (...)` test as a single Dart
/// expression rooted on a caller-provided variable name.
sealed class Predicate {
  const Predicate();

  /// Dart boolean expression that's true iff [jsonVar] matches this
  /// variant. [jsonVar] names the in-scope JSON value the test is
  /// rooted on (typically `json` for the factory parameter, `v` for
  /// a switch-pattern-bound or cast-to-List local).
  String dartIfTest(String jsonVar);
}

/// `jsonVar.containsKey('propertyName')` — picks variants by the
/// presence of a unique property (required or optional).
@immutable
class KeyExists extends Predicate {
  const KeyExists(this.propertyName);

  final String propertyName;

  @override
  String dartIfTest(String jsonVar) => "$jsonVar.containsKey('$propertyName')";
}

/// `(jsonVar.first as Map<String, dynamic>).containsKey('propertyName')`
/// — peeks the first element of a List local for a unique property.
/// Caller is responsible for binding `jsonVar` to a non-null `List`;
/// the test short-circuits on `.isNotEmpty` so empty lists fall through
/// to the next arm without throwing.
@immutable
class ArrayElementHasKey extends Predicate {
  const ArrayElementHasKey(this.propertyName);

  final String propertyName;

  @override
  String dartIfTest(String jsonVar) {
    final cast = '($jsonVar.first as Map<String, dynamic>)';
    return "$jsonVar.isNotEmpty && $cast.containsKey('$propertyName')";
  }
}

/// `jsonVar['propertyName'] is List && (...).first is <shapeKey>` — picks
/// variants whose required keys are identical at the top level but whose
/// shared array property has items of distinguishably different JSON shape
/// across variants. Real-world sites:
///
/// - github's `validation-error` (errors items are objects) vs
///   `validation-error-simple` (errors items are strings) — same top-
///   level keys, distinguished by `errors[0]`'s shape.
/// - github's `issues/add-labels` request body — the object-shaped
///   variants share an `array<string>` vs `array<object>` `labels`
///   property and dispatch on it.
///
/// The test short-circuits on `is List` (non-list / null fall through)
/// and on `.isNotEmpty` (empty lists fall through). A missing or empty
/// property won't match any shape arm — the caller is responsible for
/// either an [Always] fallback variant or accepting a runtime throw.
@immutable
class PropertyArrayItemShape extends Predicate {
  const PropertyArrayItemShape({
    required this.propertyName,
    required this.shapeKey,
  });

  /// JSON property name to navigate into (must be a List in the
  /// matching variant).
  final String propertyName;

  /// Dart `is`-test type for the first element — matches the values
  /// returned by the dispatch picker's shape classifier (e.g.
  /// `'String'`, `'Map<String, dynamic>'`, `'int'`, `'List<dynamic>'`).
  final String shapeKey;

  @override
  String dartIfTest(String jsonVar) {
    final access = "$jsonVar['$propertyName']";
    return '$access is List && '
        '($access as List).isNotEmpty && '
        '($access as List).first is $shapeKey';
  }
}

/// `jsonVar.isNotEmpty && jsonVar.first is <typeName>` — peeks the
/// first element of a List local and tests its Dart runtime type.
/// Used to disambiguate sibling array variants whose element types
/// have distinct JSON shapes (e.g. `array<string>` vs
/// `array<object>` — `String` vs `Map<String, dynamic>`). Caller is
/// responsible for binding `jsonVar` to a non-null `List`; the
/// `isNotEmpty` short-circuit lets empty lists fall through to the
/// next arm without throwing.
@immutable
class ArrayElementIsType extends Predicate {
  const ArrayElementIsType(this.typeName);

  /// Dart type name to test against — the same string [_jsonShapeKey]
  /// returns for the items' resolved schema (`'String'`, `'int'`,
  /// `'num'`, `'bool'`, `'Map<String, dynamic>'`, …).
  final String typeName;

  @override
  String dartIfTest(String jsonVar) =>
      '$jsonVar.isNotEmpty && $jsonVar.first is $typeName';
}

/// Catch-all predicate — the dispatch's optional unguarded fallback.
/// Never emits an `if` test; the template treats it as the
/// unconditional `return Wrapper(...)` at the end of the chain.
@immutable
class Always extends Predicate {
  const Always();

  @override
  String dartIfTest(String jsonVar) =>
      throw StateError('Always has no if-test — emit it as the fallback.');
}

/// One arm of a [PredicateDispatch]: the variant and the predicate
/// that picks it. [variant] is a [ResolvedSchema] reference rather
/// than a Dart name — render does the name lookup.
@immutable
class PredicateArm {
  const PredicateArm({required this.variant, required this.predicate});

  final ResolvedSchema variant;
  final Predicate predicate;

  bool get isFallback => predicate is Always;
}

/// One arm of a shape-driven dispatch — the variant and its JSON
/// runtime-type test (e.g. `String`, `List<dynamic>`,
/// `Map<String, dynamic>`).
@immutable
class ShapeArm {
  const ShapeArm({required this.variant, required this.shapeKey});

  final ResolvedSchema variant;
  final String shapeKey;
}

/// Distinguishes the two flavors of [PredicateDispatch] for the
/// renderer — they share the if-chain shape but differ in factory
/// parameter type, preamble (the cast-to-List local), throw message,
/// and the wrapper-subclass `toJson()` return type.
enum PredicateDispatchKind { requiredField, arrayElement }

/// How a oneOf/anyOf's `fromJson` is structured. All variant
/// references are [ResolvedSchema]s; render translates each into the
/// concrete Dart wrapper-class name and per-variant conversion.
sealed class DispatchDecision {
  const DispatchDecision();
}

/// `switch (json[propertyName]) { 'value' => Wrapper(...), ... }` —
/// either an explicit `discriminator` from the spec or an implicit
/// one synthesized from variants whose enum property tags them
/// uniquely. A variant's enum may have one value (the classic
/// single-value tag) or multiple — what matters is that the value
/// sets are pairwise disjoint across variants. The mapping carries
/// one entry per enum value, multiple of which may point at the
/// same variant.
@immutable
class DiscriminatorDispatch extends DispatchDecision {
  const DiscriminatorDispatch({
    required this.propertyName,
    required this.mapping,
    required this.variants,
  });

  /// JSON property to switch on.
  final String propertyName;

  /// Each entry is a `(value, variant)` pair. Order is the order
  /// `mapping` keys appear; the renderer's `case` arms follow it.
  /// Values are typically `String` but `int` for integer-typed
  /// discriminators; the [propertyName] property's enum on each
  /// variant pins this — the picker rejects collections whose
  /// variants disagree on value type.
  final List<({Object value, ResolvedSchema variant})> mapping;

  /// All variants in declaration order (matches the spec's `oneOf`
  /// ordering). Drives the order subclasses are declared.
  final List<ResolvedSchema> variants;
}

/// `switch (json) { final T v => Wrapper(T-conversion), ... }` —
/// every variant has a unique JSON shape (`String`, `int`, `List<…>`,
/// `Map<String, dynamic>`, …) so the runtime type alone picks the
/// arm.
@immutable
class ShapeDispatch extends DispatchDecision {
  const ShapeDispatch({required this.arms});

  /// One arm per variant, in declaration order.
  final List<ShapeArm> arms;
}

/// Mixed-shape dispatch: some variants pick by unique JSON shape, the
/// remaining variants collide on `Map<String, dynamic>` and/or
/// `List<dynamic>` and need a per-shape sub-dispatch in nested arms.
///
/// Up to two sub-dispatches can be active simultaneously: Map (by
/// `containsKey`) and List (by `v.first is <Type>`). Each
/// sub-dispatch can have an optional unguarded fallback. Single-
/// variant non-collision shapes go to [shapeArms] unchanged.
@immutable
class HybridDispatch extends DispatchDecision {
  const HybridDispatch({
    required this.shapeArms,
    required this.mapArms,
    required this.mapFallback,
    required this.listArms,
    required this.listFallback,
    required this.declarationOrder,
  });

  /// Non-collision-shape variants — one per unique shape, dispatched
  /// by runtime type pattern. Excludes any shape that has 2+ variants;
  /// those go to [mapArms] / [listArms] for sub-dispatch.
  final List<ShapeArm> shapeArms;

  /// Map-shaped variants — dispatched by `containsKey` on the
  /// switch-bound `v` local. Each arm is a [PredicateArm] whose
  /// predicate is [KeyExists] (or, for the implicit fallback,
  /// [Always] — but the fallback is broken out separately as
  /// [mapFallback]). Empty when at most one Map variant exists (it
  /// goes to [shapeArms] instead).
  final List<PredicateArm> mapArms;

  /// Optional unguarded fallback among the Map-shaped variants —
  /// renders as `final Map<String, dynamic> v => Wrapper(…)` after
  /// every checked Map arm. Null when no Map variant is fallback-
  /// eligible (the sub-dispatch ends in a throw).
  final ResolvedSchema? mapFallback;

  /// List-shaped variants — dispatched by peeking
  /// `v.first is <typeName>` on the switch-bound `v` local. Each arm
  /// is a [PredicateArm] whose predicate is [ArrayElementIsType] (or
  /// [Always] for an implicit fallback, broken out as [listFallback]).
  /// Empty when at most one List variant exists.
  final List<PredicateArm> listArms;

  /// Optional unguarded fallback among the List-shaped variants —
  /// renders as `final List<dynamic> v => Wrapper(…)` after every
  /// checked List arm. Null when the sub-dispatch ends in a throw.
  final ResolvedSchema? listFallback;

  /// All variants in spec declaration order, including shape arms,
  /// Map arms, and List arms. Drives the order of subclass
  /// declarations.
  final List<ResolvedSchema> declarationOrder;
}

/// `if (predicate) return Wrapper(…)` chain followed by an optional
/// unguarded fallback. Covers two flavors today:
///
/// - [PredicateDispatchKind.requiredField] — factory takes
///   `Map<String, dynamic>` directly; predicates are [KeyExists] on
///   the parameter; wrappers wrap the Map back as `value.toJson()`.
/// - [PredicateDispatchKind.arrayElement] — factory takes `dynamic`,
///   the renderer emits a `final v = json as List;` preamble, and
///   predicates are [ArrayElementHasKey] on `v`.
///
/// Adding a future kind that fits the if-chain shape is a new
/// [PredicateDispatchKind] value plus the predicate(s) it produces —
/// no new [DispatchDecision] subclass.
@immutable
class PredicateDispatch extends DispatchDecision {
  const PredicateDispatch({
    required this.kind,
    required this.arms,
  });

  final PredicateDispatchKind kind;

  /// One arm per variant, in declaration order. At most one arm has
  /// [Always] as its predicate (the unguarded fallback) — the
  /// renderer emits it without an `if` guard at the end of the
  /// chain.
  final List<PredicateArm> arms;
}

/// No dispatch — render emits the legacy `UnimplementedError` stub.
@immutable
class NoDispatch extends DispatchDecision {
  const NoDispatch();
}

/// Inspects a resolved oneOf/anyOf and decides how its `fromJson`
/// will be structured. Pure structural — looks only at the resolved
/// schemas' shapes (required/optional properties, items types,
/// discriminator). Returns [NoDispatch] when no strategy fits.
DispatchDecision decideDispatch(ResolvedSchemaCollection collection) {
  // AllOf isn't a polymorphic dispatch — every member must validate,
  // so there's no "pick one variant" at runtime. Render flattens it
  // into a synthetic merged object; dispatch is never consulted in
  // that path. Returning NoDispatch unconditionally keeps the
  // contract honest for callers that walk every collection (the
  // naming pass enumerates wrappers from each `decideDispatch`
  // result, and AllOf produces none).
  if (collection is ResolvedAllOf) return const NoDispatch();
  final variants = collection.schemas;
  // anyOf is weaker than oneOf — overlap between variants is
  // permitted at the spec level. The loose required-field picker
  // (which only requires the dispatch property to not be *required*
  // by another variant) is safe under that semantic, where strict
  // would be unsafe under oneOf. github's check-runs PATCH is the
  // canonical case: anyOf variants share most properties with
  // benign optional-overlap and dispatch via `containsKey`.
  final isAnyOf = collection is ResolvedAnyOf;
  return _pickDiscriminator(collection, variants) ??
      _pickShape(variants) ??
      _pickHybrid(variants) ??
      _pickRequiredField(variants, looseRequiredUniqueness: isAnyOf) ??
      _pickPropertyArrayElementShape(variants) ??
      _pickArrayElement(variants) ??
      _pickPropertyArrayItemShape(variants) ??
      const NoDispatch();
}

/// JSON runtime-type key for shape-driven dispatch. Returns null for
/// schemas that have no fixed shape (open unions, refs whose target
/// can't be classified, …) — those disqualify shape dispatch.
///
/// `createsNewType` schemas (named objects, enums, named newtypes)
/// also return null here: they're fronted by a Dart class so the
/// shape-dispatch arm would need to construct that class, which is
/// what the wrapper-subclass machinery already does. Returning a
/// shape key for them would let the picker route past their wrapper.
String? _jsonShapeKey(ResolvedSchema schema) {
  return switch (schema) {
    ResolvedString() => schema.createsNewType ? null : 'String',
    ResolvedInteger() => schema.createsNewType ? null : 'int',
    ResolvedNumber() => schema.createsNewType ? null : 'num',
    // Of the pod types only boolean has a JSON shape key today —
    // DateTime / URI / email / etc. all serialize as strings, so they
    // collide with bare strings on shape and need a different
    // strategy. Boolean is `bool`-shaped and unambiguous.
    ResolvedPod() =>
      !schema.createsNewType && schema.type == PodType.boolean ? 'bool' : null,
    ResolvedArray() => _listShapeKey,
    ResolvedObject() => _mapShapeKey,
    // allOf is rendered as a synthesized RenderObject (member-wise
    // merge of properties + required), so for shape-dispatch purposes
    // it's Map-shaped just like a plain object.
    ResolvedAllOf() => _mapShapeKey,
    ResolvedMap() => _mapShapeKey,
    ResolvedEmptyObject() => _mapShapeKey,
    // Enums serialize as their value type — `String` or `int`.
    // Shape-dispatchable as long as no sibling variant collides on
    // the same key. Must agree with [RenderEnum.jsonShapeKey] (the
    // render side splices the same string into the `case <type> v =>`
    // arm), and with [RenderInteger.jsonShapeKey] / [RenderString]'s
    // non-newtype keys for cross-shape collisions.
    ResolvedStringEnum() => 'String',
    ResolvedIntEnum() => 'int',
    // RecursiveRef points at a top-level (always object today). Treat
    // as Map for shape collision purposes; render handles the actual
    // construction via the target's name.
    ResolvedRecursiveRef() => _mapShapeKey,
    _ => null,
  };
}

/// Required properties of an object-or-allOf variant. For
/// [ResolvedObject] this is just `requiredProperties`; for
/// [ResolvedAllOf] we walk the merged members and union the
/// required-sets — matching the synthesized `RenderObject` that
/// `toRenderSchema` will produce.
Set<String> _flattenedRequiredProperties(ResolvedSchema schema) {
  return switch (schema) {
    ResolvedObject() => schema.requiredProperties.toSet(),
    ResolvedAllOf() => {
      for (final member in schema.schemas)
        ..._flattenedRequiredProperties(member),
    },
    _ => const <String>{},
  };
}

/// All properties of an object-or-allOf variant (key + ResolvedSchema
/// value). [ResolvedAllOf] members are unioned; on key collision the
/// last member wins, matching `toRenderSchema`'s `addAll` order.
Map<String, ResolvedSchema> _flattenedProperties(ResolvedSchema schema) {
  return switch (schema) {
    ResolvedObject() => schema.properties,
    ResolvedAllOf() => {
      for (final member in schema.schemas) ..._flattenedProperties(member),
    },
    _ => const <String, ResolvedSchema>{},
  };
}

bool _isObjectLike(ResolvedSchema schema) =>
    schema is ResolvedObject ||
    schema is ResolvedEmptyObject ||
    schema is ResolvedAllOf;

const String _mapShapeKey = 'Map<String, dynamic>';
const String _listShapeKey = 'List<dynamic>';

DiscriminatorDispatch? _pickDiscriminator(
  ResolvedSchemaCollection collection,
  List<ResolvedSchema> variants,
) {
  // AllOf is composition, not dispatch — handled in `decideDispatch`.
  // OneOf and AnyOf are both dispatchable via discriminator: at the
  // JSON-decode site we read a property and route to a variant; the
  // oneOf-vs-anyOf semantic difference (mutual-exclusion vs
  // at-least-one) doesn't affect the runtime decision.
  if (collection is ResolvedAllOf) return null;
  // Discriminator dispatch only works when every variant is
  // object-shaped (i.e. has a `fromJson(Map<String, dynamic>)`).
  // Includes allOf which renders as a synthesized object.
  if (!variants.every(_isObjectLike)) return null;
  // Prefer the explicit discriminator + its mapping. Fall through to
  // an implicit synthesis when the explicit one has no `mapping`
  // (github's check-runs POST: spec declares `propertyName: status`
  // but no mapping; each variant carries an enum on `status` whose
  // values together name the discriminated cases). OpenAPI permits
  // `discriminator` on both `oneOf` and `anyOf`.
  var disc = switch (collection) {
    ResolvedOneOf() => collection.discriminator,
    ResolvedAnyOf() => collection.discriminator,
    _ => null,
  };
  if (disc != null && disc.mapping == null) {
    disc = _implicitDiscriminatorForProperty(variants, disc.propertyName);
  }
  disc ??= _implicitDiscriminator(variants);
  if (disc == null) return null;
  final mapping = disc.mapping;
  if (mapping == null) return null;
  return DiscriminatorDispatch(
    propertyName: disc.propertyName,
    mapping: [
      for (final entry in mapping.entries)
        (value: entry.key, variant: entry.value),
    ],
    variants: variants,
  );
}

/// Like [_implicitDiscriminator] but constrained to a specific
/// [propertyName] declared by the spec's explicit discriminator.
/// Used to fill in a missing `mapping` when the spec says
/// "discriminate on `status`" but doesn't enumerate which value
/// routes where — we read each variant's enum on `status` and
/// build the mapping from there.
///
/// The property is not required to be `required` here (unlike
/// [_implicitDiscriminator]'s implicit-detection mode): the spec
/// author's explicit `discriminator:` declaration is the signal
/// that runtime dispatch on this property is intended. Variants
/// where the JSON omits the field will throw the
/// `FormatException` already emitted by the discriminator switch's
/// default arm — matching the failure mode of today's stub.
ResolvedDiscriminator? _implicitDiscriminatorForProperty(
  List<ResolvedSchema> variants,
  String propertyName,
) {
  if (variants.isEmpty) return null;
  if (!variants.every(_isObjectLike)) return null;
  final flatProps = variants.map(_flattenedProperties).toList();
  final perVariantValues = <List<Object>>[];
  for (var i = 0; i < variants.length; i++) {
    final type = flatProps[i][propertyName];
    if (type is! ResolvedEnum || type.values.isEmpty) return null;
    perVariantValues.add(List.of(type.values));
  }
  final seen = <Object>{};
  for (final values in perVariantValues) {
    for (final v in values) {
      if (!seen.add(v)) return null;
    }
  }
  return ResolvedDiscriminator(
    propertyName: propertyName,
    mapping: {
      for (var i = 0; i < variants.length; i++)
        for (final v in perVariantValues[i]) v: variants[i],
    },
  );
}

/// Synthesized discriminator for object-only oneOf/anyOf collections
/// whose variants each tag themselves with an enum property. The
/// classic case (github's `repository-rule` shape) is single-value
/// enums: every variant declares, e.g., `type: { enum: ['creation'] }`,
/// required. We also accept multi-value enums per variant (github's
/// check-runs POST: variant 0 has `status: enum [completed]`, variant
/// 1 has `status: enum [queued, in_progress, ...]`) — as long as the
/// value sets are pairwise disjoint, each enum value routes to exactly
/// one variant.
///
/// Variants may be [ResolvedObject] OR [ResolvedAllOf] — the latter
/// flattens its members the same way `toRenderSchema` synthesizes a
/// `RenderObject`, so a tag declared in one allOf member counts.
ResolvedDiscriminator? _implicitDiscriminator(List<ResolvedSchema> variants) {
  if (variants.isEmpty) return null;
  if (!variants.every(_isObjectLike)) return null;
  final flatRequired = variants.map(_flattenedRequiredProperties).toList();
  final flatProps = variants.map(_flattenedProperties).toList();
  final candidates = <(String, List<List<Object>>)>[];
  for (final entry in flatProps.first.entries) {
    final propName = entry.key;
    if (!flatRequired.first.contains(propName)) continue;
    final firstType = entry.value;
    if (firstType is! ResolvedEnum || firstType.values.isEmpty) continue;
    final perVariantValues = <List<Object>>[List.of(firstType.values)];
    var allMatch = true;
    for (var i = 1; i < variants.length; i++) {
      if (!flatRequired[i].contains(propName)) {
        allMatch = false;
        break;
      }
      final otherType = flatProps[i][propName];
      if (otherType is! ResolvedEnum || otherType.values.isEmpty) {
        allMatch = false;
        break;
      }
      // All variants' tag enums must agree on the value type — mixing
      // string and integer tags within one discriminator would force
      // a runtime check we don't want to emit.
      if (otherType.runtimeType != firstType.runtimeType) {
        allMatch = false;
        break;
      }
      perVariantValues.add(List.of(otherType.values));
    }
    if (allMatch) candidates.add((propName, perVariantValues));
  }
  if (candidates.isEmpty) return null;
  candidates.sort((a, b) => a.$1.compareTo(b.$1));
  for (final (propName, perVariantValues) in candidates) {
    // Pairwise-disjoint check on the union of each variant's enum
    // values. A duplicate value would route to two variants — not a
    // valid discriminator.
    final seen = <Object>{};
    var disjoint = true;
    for (final values in perVariantValues) {
      for (final v in values) {
        if (!seen.add(v)) {
          disjoint = false;
          break;
        }
      }
      if (!disjoint) break;
    }
    if (!disjoint) continue;
    return ResolvedDiscriminator(
      propertyName: propName,
      mapping: {
        for (var i = 0; i < variants.length; i++)
          for (final v in perVariantValues[i]) v: variants[i],
      },
    );
  }
  return null;
}

ShapeDispatch? _pickShape(List<ResolvedSchema> variants) {
  final keys = <String>{};
  final arms = <ShapeArm>[];
  for (final v in variants) {
    final k = _jsonShapeKey(v);
    if (k == null) return null;
    if (!keys.add(k)) return null;
    arms.add(ShapeArm(variant: v, shapeKey: k));
  }
  return ShapeDispatch(arms: arms);
}

HybridDispatch? _pickHybrid(List<ResolvedSchema> variants) {
  // Eligibility: every variant has a shape key, and at least one
  // shape has 2+ variants colliding (so a sub-dispatch is needed).
  // We can sub-dispatch Map collisions by required-field and List
  // collisions by element-type peek; any other shape collision (e.g.
  // two `String` variants) bails.
  final byShape = <String, List<ResolvedSchema>>{};
  for (final v in variants) {
    final k = _jsonShapeKey(v);
    if (k == null) return null;
    byShape.putIfAbsent(k, () => []).add(v);
  }
  final mapVariants = byShape[_mapShapeKey] ?? const <ResolvedSchema>[];
  final listVariants = byShape[_listShapeKey] ?? const <ResolvedSchema>[];
  // Need at least one sub-dispatch — otherwise the picker would be
  // straight `_pickShape`.
  if (mapVariants.length < 2 && listVariants.length < 2) return null;
  // If only one sub-dispatch is active, every other shape must be
  // single-variant. Two single-shape arms aren't strictly necessary
  // (a sub-dispatch alone could be its own mode), but we require at
  // least one non-collision arm to keep hybrid distinct from a pure
  // sub-dispatch — the pure-sub-dispatch case is handled by
  // [_pickRequiredField] / [_pickArrayElement].
  if (byShape.length < 2) return null;
  final shapeArms = <ShapeArm>[];
  for (final entry in byShape.entries) {
    if (entry.key == _mapShapeKey || entry.key == _listShapeKey) continue;
    if (entry.value.length > 1) return null;
    shapeArms.add(ShapeArm(variant: entry.value.single, shapeKey: entry.key));
  }
  // Sub-dispatch the Map variants by required-field (loose mode —
  // see [_requiredFieldArmsFor]). When that fails (variants share
  // both required and optional sets, e.g. github's `add-labels`
  // request body where two object variants only differ in an
  // optional array property's element type), retry with the
  // property-array-element-shape strategy. 0/1 Map variant: the
  // single Map variant (if any) acts as a single shape arm.
  final List<PredicateArm> checkedMapArms;
  ResolvedSchema? mapFallback;
  if (mapVariants.length >= 2) {
    final mapArms =
        _requiredFieldArmsFor(mapVariants, looseRequiredUniqueness: true) ??
        _propertyArrayElementShapeArmsFor(mapVariants);
    if (mapArms == null) return null;
    checkedMapArms = [];
    for (final arm in mapArms) {
      if (arm.isFallback) {
        mapFallback = arm.variant;
      } else {
        checkedMapArms.add(arm);
      }
    }
  } else {
    checkedMapArms = const [];
    if (mapVariants.length == 1) {
      shapeArms.add(
        ShapeArm(variant: mapVariants.single, shapeKey: _mapShapeKey),
      );
    }
  }
  // Sub-dispatch the List variants by element-type peek. 0/1 List
  // variant: same single-shape-arm fallthrough as Map.
  final List<PredicateArm> checkedListArms;
  ResolvedSchema? listFallback;
  if (listVariants.length >= 2) {
    final listArms = _arrayElementShapeArmsFor(listVariants);
    if (listArms == null) return null;
    checkedListArms = [];
    for (final arm in listArms) {
      if (arm.isFallback) {
        listFallback = arm.variant;
      } else {
        checkedListArms.add(arm);
      }
    }
  } else {
    checkedListArms = const [];
    if (listVariants.length == 1) {
      shapeArms.add(
        ShapeArm(variant: listVariants.single, shapeKey: _listShapeKey),
      );
    }
  }
  // Re-derive shape arms in spec declaration order so subclass
  // declarations match the variant ordering. Skip variants that went
  // to a sub-dispatch (their shape has multiple collisions).
  final declarationOrder = variants;
  final shapeArmsInOrder = <ShapeArm>[];
  for (final v in declarationOrder) {
    final k = _jsonShapeKey(v);
    if (k == _mapShapeKey && mapVariants.length >= 2) continue;
    if (k == _listShapeKey && listVariants.length >= 2) continue;
    shapeArmsInOrder.add(shapeArms.firstWhere((a) => a.variant == v));
  }
  return HybridDispatch(
    shapeArms: shapeArmsInOrder,
    mapArms: checkedMapArms,
    mapFallback: mapFallback,
    listArms: checkedListArms,
    listFallback: listFallback,
    declarationOrder: declarationOrder,
  );
}

/// Sub-dispatch arms for a list of List-shaped variants — picks each
/// by the Dart runtime type of its first element. Returns null if
/// any two variants share an element shape key (no way to tell their
/// first elements apart). At most one variant may be the fallback (an
/// items schema with no fixed shape, e.g. an open union); a second
/// fallback bails.
List<PredicateArm>? _arrayElementShapeArmsFor(
  List<ResolvedSchema> arrayVariants,
) {
  final arms = <PredicateArm>[];
  final usedTypes = <String>{};
  var fallbackCount = 0;
  for (final v in arrayVariants) {
    if (v is! ResolvedArray) return null;
    final itemKey = _jsonShapeKey(v.items);
    if (itemKey == null) {
      fallbackCount++;
      if (fallbackCount > 1) return null;
      arms.add(PredicateArm(variant: v, predicate: const Always()));
      continue;
    }
    if (!usedTypes.add(itemKey)) return null;
    arms.add(PredicateArm(variant: v, predicate: ArrayElementIsType(itemKey)));
  }
  return arms;
}

/// Sub-dispatch arms for object-like variants whose property sets are
/// identical *modulo* one array-typed property's element shape.
/// Picks each by peeking that property's first element type (the
/// github `issues/add-labels` request body shape: two object variants
/// `{labels?: array<string>}` and `{labels?: array<object>}`, neither
/// distinguishable by `containsKey` alone).
///
/// Returns null when the variants don't fit this exact shape — same
/// property names across all variants, exactly one such property is
/// array-typed with element-shape-distinguishable items across at
/// least two variants, the rest of the properties are identical
/// resolved schemas, and no two variants share the array-element
/// shape. The variant whose array-element shape isn't pinnable (open
/// union, etc.) becomes the fallback; at most one fallback allowed.
List<PredicateArm>? _propertyArrayElementShapeArmsFor(
  List<ResolvedSchema> variants,
) {
  if (variants.length < 2) return null;
  if (!variants.every((v) => v is ResolvedObject)) return null;
  final objects = variants.cast<ResolvedObject>();
  // Same property name set across variants. (Same required set too —
  // a difference in required-ness would have been picked up by
  // `_requiredFieldArmsFor` upstream.)
  final firstPropNames = objects.first.properties.keys.toSet();
  for (final o in objects.skip(1)) {
    if (!const SetEquality<String>().equals(
      o.properties.keys.toSet(),
      firstPropNames,
    )) {
      return null;
    }
    if (!const SetEquality<String>().equals(
      o.requiredProperties.toSet(),
      objects.first.requiredProperties.toSet(),
    )) {
      return null;
    }
  }
  // Find the single array-typed property whose items' shape key
  // differs across variants. Other properties must be structurally
  // identical (resolved-schema equality) to keep the dispatch sound.
  String? discriminatorProp;
  for (final propName in firstPropNames) {
    // Property names are confirmed identical across variants above,
    // so each lookup hits — null-check to bind a non-nullable local
    // and stay off the bang operator.
    final perVariant = <ResolvedSchema>[];
    for (final o in objects) {
      final p = o.properties[propName];
      if (p == null) return null;
      perVariant.add(p);
    }
    if (perVariant.every((p) => p is ResolvedArray)) {
      final itemKeys = perVariant
          .cast<ResolvedArray>()
          .map((a) => _jsonShapeKey(a.items))
          .toList();
      // At least two distinct shape keys across variants (counting
      // `null` as its own bucket — those become the fallback).
      final distinctKeys = <String?>{...itemKeys};
      if (distinctKeys.length >= 2) {
        if (discriminatorProp != null) return null;
        discriminatorProp = propName;
        continue;
      }
    }
    // Non-discriminator property — must be identical across variants.
    if (!perVariant.every((p) => p == perVariant.first)) return null;
  }
  if (discriminatorProp == null) return null;
  // When the discriminator property is optional in every variant
  // (the github labels case: `labels` has no `required:`), the
  // property-array predicates can all miss at runtime — `{}` matches
  // none of them. In that case, keep the last variant as an
  // unguarded fallback so a missing/empty array still picks
  // *something* (matches the spec author's intent that any of the
  // two object shapes accepts an empty payload). When the property
  // is required, every match must be predicate-tagged so a payload
  // missing the discriminator is a hard error.
  final discriminatorRequired = objects.every(
    (o) => o.requiredProperties.contains(discriminatorProp),
  );
  final fallbackIndex = discriminatorRequired ? -1 : objects.length - 1;
  final arms = <PredicateArm>[];
  final usedTypes = <String>{};
  var fallbackCount = 0;
  for (var i = 0; i < objects.length; i++) {
    final o = objects[i];
    final prop = o.properties[discriminatorProp];
    if (prop is! ResolvedArray) return null;
    final itemKey = _jsonShapeKey(prop.items);
    final isUnpinnable =
        itemKey == null || usedTypes.contains(itemKey) || i == fallbackIndex;
    if (isUnpinnable) {
      fallbackCount++;
      if (fallbackCount > 1) return null;
      arms.add(PredicateArm(variant: o, predicate: const Always()));
      continue;
    }
    usedTypes.add(itemKey);
    arms.add(
      PredicateArm(
        variant: o,
        predicate: PropertyArrayItemShape(
          propertyName: discriminatorProp,
          shapeKey: itemKey,
        ),
      ),
    );
  }
  return arms;
}

PredicateDispatch? _pickRequiredField(
  List<ResolvedSchema> variants, {
  bool looseRequiredUniqueness = false,
}) {
  final arms = _requiredFieldArmsFor(
    variants,
    looseRequiredUniqueness: looseRequiredUniqueness,
  );
  if (arms == null) return null;
  return PredicateDispatch(
    kind: PredicateDispatchKind.requiredField,
    arms: arms,
  );
}

/// Object-variant dispatch by an array property's element shape.
/// See [_propertyArrayElementShapeArmsFor] for the shape contract.
/// Runs after [_pickRequiredField] in the picker chain — only when
/// `containsKey`-style dispatch can't separate the variants do we
/// peek into an array property's first element.
PredicateDispatch? _pickPropertyArrayElementShape(
  List<ResolvedSchema> variants,
) {
  final arms = _propertyArrayElementShapeArmsFor(variants);
  if (arms == null) return null;
  return PredicateDispatch(
    kind: PredicateDispatchKind.requiredField,
    arms: arms,
  );
}

PredicateDispatch? _pickArrayElement(List<ResolvedSchema> variants) {
  if (!variants.every((v) => v is ResolvedArray)) return null;
  final arrays = variants.cast<ResolvedArray>();
  final innerArms = _requiredFieldArmsFor(arrays.map((a) => a.items).toList());
  if (innerArms == null) return null;
  // Translate inner predicates (KeyExists on items' Map) to outer
  // ones (ArrayElementHasKey on the cast list local).
  final outerArms = <PredicateArm>[];
  for (var i = 0; i < arrays.length; i++) {
    final inner = innerArms[i].predicate;
    final outer = switch (inner) {
      KeyExists(:final propertyName) => ArrayElementHasKey(propertyName),
      Always() => const Always(),
      ArrayElementHasKey() ||
      ArrayElementIsType() ||
      PropertyArrayItemShape() => throw StateError(
        'Unexpected nested array-element/property-array predicate from '
        'inner arms — _requiredFieldArmsFor only emits KeyExists/Always',
      ),
    };
    outerArms.add(PredicateArm(variant: arrays[i], predicate: outer));
  }
  return PredicateDispatch(
    kind: PredicateDispatchKind.arrayElement,
    arms: outerArms,
  );
}

/// Last-resort picker for object-shaped variants whose top-level keys
/// are *identical* (so neither [_pickRequiredField] nor [_pickHybrid]
/// can separate them) but that share an array property whose items have
/// pairwise-distinct JSON shapes across variants.
///
/// Real-world site: github's `oneOf<validation-error,
/// validation-error-simple>`. Both have the same required keys
/// `[message, documentation_url]` and the same optional `errors` key;
/// the only structural difference is `errors[].items` (object vs
/// string). The emitted dispatch tests `json['errors']` is a non-empty
/// list and peeks the first element's shape.
///
/// The last variant becomes an unguarded [Always] fallback: when the
/// shape-discriminator property is absent or empty (spec-legal — both
/// github variants list `errors` as optional), the last variant
/// catches the response. Without this, a 422 with no `errors` would
/// throw `FormatException` even though the JSON is valid per the spec.
PredicateDispatch? _pickPropertyArrayItemShape(List<ResolvedSchema> variants) {
  if (variants.length < 2) return null;
  if (!variants.every(_isObjectLike)) return null;
  // Walk every property name common to *all* variants where the
  // property's value is a ResolvedArray. For each, classify the items'
  // JSON shape per variant and accept the first property whose shapes
  // are pairwise distinct.
  final perVariantProps = variants.map(_flattenedProperties).toList();
  final commonNames = perVariantProps.first.keys.toSet();
  for (var i = 1; i < perVariantProps.length; i++) {
    commonNames.retainAll(perVariantProps[i].keys);
  }
  // Deterministic order so the picker's choice doesn't depend on Map
  // iteration order.
  final sorted = commonNames.toList()..sort();
  for (final propName in sorted) {
    final shapes = <String>[];
    var ok = true;
    for (final props in perVariantProps) {
      final value = props[propName];
      if (value is! ResolvedArray) {
        ok = false;
        break;
      }
      final shape = _jsonShapeKey(value.items);
      if (shape == null) {
        ok = false;
        break;
      }
      shapes.add(shape);
    }
    if (!ok) continue;
    if (shapes.toSet().length != shapes.length) continue;
    // All but the last variant get a shape-checking predicate; the
    // last variant is the unguarded fallback (catches absent / empty
    // discriminator-property cases that are spec-legal but match no
    // shape arm).
    final arms = <PredicateArm>[];
    for (var i = 0; i < variants.length - 1; i++) {
      arms.add(
        PredicateArm(
          variant: variants[i],
          predicate: PropertyArrayItemShape(
            propertyName: propName,
            shapeKey: shapes[i],
          ),
        ),
      );
    }
    arms.add(
      PredicateArm(variant: variants.last, predicate: const Always()),
    );
    return PredicateDispatch(
      kind: PredicateDispatchKind.requiredField,
      arms: arms,
    );
  }
  return null;
}

/// Property-presence dispatch on object-shaped variants. Each variant
/// is keyed off a property unique to it across the oneOf — required
/// when possible, falling back to optional. A variant with no unique
/// property at all becomes the fallback (at most one allowed).
///
/// [looseRequiredUniqueness] relaxes "required-unique" to "no sibling
/// *requires* it" instead of "no sibling lists it as a property at
/// all". Loose is needed by the hybrid path (whose Map sub-arms can
/// have benign optional-overlap) but unsafe for the pure required-
/// field path.
List<PredicateArm>? _requiredFieldArmsFor(
  List<ResolvedSchema> variants, {
  bool looseRequiredUniqueness = false,
}) {
  if (!variants.every(_isObjectLike)) return null;
  final allRequired = variants.map(_flattenedRequiredProperties).toList();
  final allProps = variants
      .map((s) => _flattenedProperties(s).keys.toSet())
      .toList();
  final arms = <PredicateArm>[];
  var fallbackCount = 0;
  for (var i = 0; i < variants.length; i++) {
    final mineReq = allRequired[i];
    final mineProps = allProps[i];
    final othersReq = <String>{};
    final othersProps = <String>{};
    for (var j = 0; j < allRequired.length; j++) {
      if (i == j) continue;
      othersReq.addAll(allRequired[j]);
      othersProps.addAll(allProps[j]);
    }
    final uniqueRequired = mineReq.difference(
      looseRequiredUniqueness ? othersReq : othersProps,
    );
    final uniqueProps = mineProps.difference(othersProps);
    final candidates = uniqueRequired.isNotEmpty ? uniqueRequired : uniqueProps;
    if (candidates.isEmpty) {
      fallbackCount++;
      if (fallbackCount > 1) return null;
      arms.add(PredicateArm(variant: variants[i], predicate: const Always()));
      continue;
    }
    final tag = (candidates.toList()..sort()).first;
    arms.add(PredicateArm(variant: variants[i], predicate: KeyExists(tag)));
  }
  return arms;
}
