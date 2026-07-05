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
  `uint8List`, `string`, `bool_`, `int_`, `double_`, `num_`. Naming convention:
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

Landed across PRs #222 (model + `operator[]` common-type), #223 (`dartType`
made authoritative), and #224 (JSON wire type + the constant/constructor
vocabulary). The string-typed surfaces are converted.

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

### Newtype wrapped type

A newtype's wrapped underlying type (e.g. a `DateTime`-backed newtype) is a
`RenderPod` concern — `RenderPod.dartTypeName` (a `String`) today — not a
`DartType` accessor. It could become a structured `wrappedType` field *on
`RenderPod`* if newtype rendering migrates onto `DartType`, but it stays off
the value type.
