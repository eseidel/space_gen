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
/// one synthesized from variants whose required single-value enum
/// property tags them uniquely.
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
  final List<({String value, ResolvedSchema variant})> mapping;

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

/// Mixed-shape dispatch: some variants pick by JSON shape, the
/// remaining (Map-shaped) collide and need a property-presence
/// sub-dispatch in a single nested arm.
@immutable
class HybridDispatch extends DispatchDecision {
  const HybridDispatch({
    required this.shapeArms,
    required this.mapArms,
    required this.mapFallback,
    required this.declarationOrder,
  });

  /// Non-Map variants — one per unique shape, dispatched by runtime
  /// type pattern.
  final List<ShapeArm> shapeArms;

  /// Map-shaped variants — dispatched by `containsKey` on the
  /// switch-bound `v` local. Each arm is a [PredicateArm] whose
  /// predicate is [KeyExists] (or, for the implicit fallback,
  /// [Always] — but the fallback is broken out separately as
  /// [mapFallback]).
  final List<PredicateArm> mapArms;

  /// Optional unguarded fallback among the Map-shaped variants —
  /// renders as `final Map<String, dynamic> v => Wrapper(…)` after
  /// every checked Map arm. Null when no Map variant is fallback-
  /// eligible (the sub-dispatch ends in a throw).
  final ResolvedSchema? mapFallback;

  /// All variants in spec declaration order, including both
  /// shape arms and Map arms. Drives the order of subclass
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
  return _pickDiscriminator(collection, variants) ??
      _pickShape(variants) ??
      _pickHybrid(variants) ??
      _pickRequiredField(variants) ??
      _pickArrayElement(variants) ??
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
    ResolvedArray() => 'List<dynamic>',
    ResolvedObject() => _mapShapeKey,
    // allOf is rendered as a synthesized RenderObject (member-wise
    // merge of properties + required), so for shape-dispatch purposes
    // it's Map-shaped just like a plain object.
    ResolvedAllOf() => _mapShapeKey,
    ResolvedMap() => _mapShapeKey,
    ResolvedEmptyObject() => _mapShapeKey,
    // Enums always serialize as `String`; the wrapper class is the
    // enum type itself. Shape-dispatchable as long as no sibling
    // variant collides on the `String` key.
    ResolvedEnum() => 'String',
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

DiscriminatorDispatch? _pickDiscriminator(
  ResolvedSchemaCollection collection,
  List<ResolvedSchema> variants,
) {
  if (collection is! ResolvedOneOf) return null;
  final disc = collection.discriminator ?? _implicitDiscriminator(variants);
  if (disc == null) return null;
  // Discriminator dispatch only works when every variant is
  // object-shaped (i.e. has a `fromJson(Map<String, dynamic>)`).
  // Includes allOf which renders as a synthesized object.
  if (!variants.every(_isObjectLike)) return null;
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

/// Synthesized discriminator for object-only oneOfs whose variants
/// each tag themselves with a single-value enum property — github's
/// `repository-rule` shape. The spec doesn't declare a `discriminator`,
/// but every variant has, e.g., `type: { enum: ['creation'] }` with
/// that property required. The values are pairwise distinct, so the
/// parent's `fromJson` can switch on `json[<that property>]`.
///
/// Variants may be [ResolvedObject] OR [ResolvedAllOf] — the latter
/// flattens its members the same way `toRenderSchema` synthesizes a
/// `RenderObject`, so a tag declared in one allOf member counts.
ResolvedDiscriminator? _implicitDiscriminator(List<ResolvedSchema> variants) {
  if (variants.isEmpty) return null;
  if (!variants.every(_isObjectLike)) return null;
  final flatRequired = variants.map(_flattenedRequiredProperties).toList();
  final flatProps = variants.map(_flattenedProperties).toList();
  final candidates = <(String, List<String>)>[];
  for (final entry in flatProps.first.entries) {
    final propName = entry.key;
    if (!flatRequired.first.contains(propName)) continue;
    final firstType = entry.value;
    if (firstType is! ResolvedEnum || firstType.values.length != 1) continue;
    final values = [firstType.values.first];
    var allMatch = true;
    for (var i = 1; i < variants.length; i++) {
      if (!flatRequired[i].contains(propName)) {
        allMatch = false;
        break;
      }
      final otherType = flatProps[i][propName];
      if (otherType is! ResolvedEnum || otherType.values.length != 1) {
        allMatch = false;
        break;
      }
      values.add(otherType.values.first);
    }
    if (allMatch) candidates.add((propName, values));
  }
  if (candidates.isEmpty) return null;
  candidates.sort((a, b) => a.$1.compareTo(b.$1));
  for (final (propName, values) in candidates) {
    if (values.toSet().length != values.length) continue;
    return ResolvedDiscriminator(
      propertyName: propName,
      mapping: {
        for (var i = 0; i < variants.length; i++) values[i]: variants[i],
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
  // Eligibility: every variant has a shape key, at least two
  // collide on Map, and no other shape collides with itself.
  final byShape = <String, List<ResolvedSchema>>{};
  for (final v in variants) {
    final k = _jsonShapeKey(v);
    if (k == null) return null;
    byShape.putIfAbsent(k, () => []).add(v);
  }
  final mapVariants = byShape[_mapShapeKey];
  if (mapVariants == null || mapVariants.length < 2) return null;
  if (byShape.length < 2) return null;
  final shapeArms = <ShapeArm>[];
  for (final entry in byShape.entries) {
    if (entry.key == _mapShapeKey) continue;
    if (entry.value.length > 1) return null;
    shapeArms.add(ShapeArm(variant: entry.value.single, shapeKey: entry.key));
  }
  // Sub-dispatch the Map variants by required-field (loose mode —
  // see [_requiredFieldArmsFor]).
  final mapArms = _requiredFieldArmsFor(
    mapVariants,
    looseRequiredUniqueness: true,
  );
  if (mapArms == null) return null;
  // Re-derive shape arms in spec declaration order so subclass
  // declarations match the variant ordering.
  final declarationOrder = variants;
  final shapeArmsInOrder = <ShapeArm>[];
  for (final v in declarationOrder) {
    if (_jsonShapeKey(v) == _mapShapeKey) continue;
    shapeArmsInOrder.add(shapeArms.firstWhere((a) => a.variant == v));
  }
  ResolvedSchema? mapFallback;
  final checkedMapArms = <PredicateArm>[];
  for (final arm in mapArms) {
    if (arm.isFallback) {
      mapFallback = arm.variant;
    } else {
      checkedMapArms.add(arm);
    }
  }
  return HybridDispatch(
    shapeArms: shapeArmsInOrder,
    mapArms: checkedMapArms,
    mapFallback: mapFallback,
    declarationOrder: declarationOrder,
  );
}

PredicateDispatch? _pickRequiredField(List<ResolvedSchema> variants) {
  final arms = _requiredFieldArmsFor(variants);
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
      ArrayElementHasKey() => throw StateError(
        'Unexpected nested array-element predicate from inner arms',
      ),
    };
    outerArms.add(PredicateArm(variant: arrays[i], predicate: outer));
  }
  return PredicateDispatch(
    kind: PredicateDispatchKind.arrayElement,
    arms: outerArms,
  );
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
