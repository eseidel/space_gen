# DartType

`lib/src/render/dart_type.dart` — a small structured type model that replaces
string-typed type logic in the renderer.

## Why

The renderer used to compute Dart types as strings: nullability was
`'$typeName?'`, generics were `'List<${items.typeName}>'` / `'Map<$k, $v>'`,
and "what is the common type of these?" was string matching. `DartType` makes
types real values, so that logic (rendering, nullability, least-upper-bound) is
structure rather than string manipulation.

## The model

`DartType(name, {typeArguments, isNullable})` — an immutable value type
(`Equatable`):

- `name` — the base identifier (`String`, `List`, a generated class name).
- `typeArguments` — for generics.
- `isNullable` — nullability is **data**, toggled with `asNullable()` /
  `asNonNullable()`, never a string append. `toString()` is the single
  rendering source of truth and never emits a redundant `dynamic?`.

Vocabulary:

- **Constants:** `dynamic_`, `nullableObject` (`Object?`), `void_`,
  `uint8List`, `dateTime`, `uri`, `uriTemplate`, `string`, `bool_`, `int_`,
  `double_`, `num_`. All name Dart SDK types except `uriTemplate`
  (`package:uri`) — flagged with a TODO to move out if `DartType` ever
  generalizes into a project-agnostic type model. Naming convention:
  a trailing `_` for the lowercase type names (`dynamic` / `void` / `bool` /
  `int` / `double` / `num`), plain lowercase `string` for the capitalized
  `String`.
- **Constructors:** `DartType.list([element])` (element defaults to `dynamic`)
  and `DartType.map(key, value)`.
- **`commonType(Iterable<DartType>)`** — the least-upper-bound helper.

**Const gotcha:** a `const` constructor cannot build `typeArguments` from a
parameter (a list literal built from a parameter is not a constant expression),
so `.list` and `.map` are non-const; the scalar / well-known types stay const.

## What DartType backs

`RenderSchema.dartType` is the authoritative type; `typeName` and
`nullableTypeName` render from it. `jsonStorageType` (the JSON wire type)
derives from `jsonStorageDartType`. The generated `operator[]`'s return type
comes from `DartType.commonType`.

Every remaining string-typed type surface now *derives* from a `DartType`
rather than being a parallel source of truth: `RenderPod.dartTypeName` renders
from `RenderPod.wrappedType` (a `DartType`), and `RenderEnum.valueDartType`
renders from `jsonStorageDartType` (an enum's value type *is* its JSON wire
type). DartType is the single source of truth for "what Dart type is this."

Landed across PRs #222 (model + `operator[]` common-type), #223 (`dartType`
made authoritative), #224 (JSON wire type + the constant/constructor
vocabulary), and #226 (string surfaces inverted to derive from DartType).

## North star

The direction this is heading: `DartType` becomes a small, zod-like type IR
that the whole pipeline translates *into*. Much of what the generator does is
"read a generic type spec (JSON/YAML) → emit an idiomatic Dart type"; the more
that logic lives as *behavior keyed off `DartType`* (rendering, nullability,
common-type, JSON conversion) rather than per-node `switch` statements over
`PodType`/subclass, the thinner the `Render*` layer gets. Inverting the last
string surfaces (above) was the precondition: you can't safely hang behavior on
`DartType` while some nodes still compute their type as a bare string that
bypasses it.

**Home vs. key.** `DartType` (`dart_type.dart`) stays a pure value that a
future generic type system could reuse — codegen behavior does *not* go on the
class. Render-only behavior lives in an `extension on DartType` in the render
layer (`render_tree.dart`), so "keyed off `DartType`" and "method on
`DartType`" stop being in tension: the extension dispatches on the type but the
generic value never sees it (cf. the `uriTemplate` TODO in `dart_type.dart`).

**Spec-type vs. Dart-type boundary.** Not everything can key off `DartType`.
Some behavior is a pure function of the Dart type (rendering, JSON wire type,
the codec for `Uri`/`UriTemplate`/`String`/`bool`); the rest needs the *spec*
type (`PodType`) because a many-to-one spec→Dart mapping loses information Dart
can't recover. Today the only lossy cases are: `date` vs `date-time` (both
`DartType.dateTime`, but different serialize/parse) and example/invalid-JSON
fixtures (`email` vs `uuid` differ only there). Rule: **codec lives on the
`DartType` extension, except where two spec formats collapse to one Dart type**
— that residue stays keyed off `PodType` on the owning render node.

## Remaining work

### Type-graph least-upper-bound (deferred)

`DartType.commonType` currently unifies by **structural equality only** — it
matches type *names*. Distinct types that share a real supertype (two
subclasses of one base, or several generated enums that all implement `Enum`)
fall back to `Object?` even though a tighter common type exists.

A real least-upper-bound needs the inheritance graph. **Design decision:** put
the hierarchy in a separate *type environment* the function consults
(`commonType(types, graph)` / `graph.leastUpperBound(a, b)`) — **not** as a
`superType` field on `DartType`. Keeping `DartType` a pure value expression
keeps `==` simple and avoids making every type reference a graph node (the same
supertype chain repeated on every occurrence, and cycles on recursive schemas
like `Node -> Node`). The `commonType` doc comment records this too.

**Recommendation: defer until a real spec motivates it.** It only tightens the
`operator[]` return type for a "homogeneous overflow" object — one whose named
fields and `additionalProperties` value all share a single type — and no spec
in the test set has one, so building it now is speculative (see the
require-a-real-validation-target rule).

### Newtype wrapped type (done — #226)

A newtype's wrapped underlying type (e.g. a `DateTime`-backed newtype) is now
`RenderPod.wrappedType` — a `DartType` on `RenderPod`, not a bare string and
not a field on the value type. `dartTypeName` renders from it for templates
that need the bare identifier. This confirmed the design: structured type data
lives *on the render node*, `DartType` stays a pure value expression.

### Scalar JSON codec on a DartType extension (started — #227)

`DartTypeCodec` (`extension on DartType`, render layer) owns `toJsonScalar` /
`fromJsonScalar` for the leaf types the Dart type fully determines: `String`
and `bool` (JSON-native, identity), `Uri` and `UriTemplate` (`.toString()` /
`Uri.parse` / `UriTemplate(…)`). `RenderPod` keeps exhaustive `PodType` cases
(so a new format still won't compile until handled) but delegates their bodies
to the extension; `date`/`date-time` stay resolved off `PodType` because the
Dart type can't tell them apart. Unhandled types throw rather than guess.

Remaining folds toward the zod-like IR:

- **`DateTime`** — decide whether the `date`/`date-time` split is worth pulling
  into the codec (would need a spec-type discriminator the extension can see,
  since both are `DartType.dateTime`), or whether it stays on `RenderPod`.
- **Collection / object / enum conversion** — `RenderArray` / `RenderMap` /
  `RenderObject` / `RenderEnum` still hand-roll `fromJsonExpression` /
  `toJsonExpression`. These depend on context, nullability, and defaults, so
  they're a larger step than the scalar codec.
