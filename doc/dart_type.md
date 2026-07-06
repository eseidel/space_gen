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

The direction this is heading: `DartType` is the single source of truth for the
*type* — rendering, nullability, JSON wire type, common-type. Much of what the
generator does is "read a generic type spec (JSON/YAML) → emit an idiomatic Dart
type", and the more that type logic is structure on `DartType` rather than
string manipulation or per-node `switch` statements, the thinner the `Render*`
layer gets. That work is largely done (#222–#226).

**Where it stops: JSON conversion.** It's tempting to also move
`fromJsonExpression` / `toJsonExpression` onto `DartType`, but conversion is a
pure function of `DartType` *only for scalars*. For composite and named types it
is a function of the schema's **structure** — an object's fields and their
per-field nullability/defaults, an array's element codec, whether a name is a
newtype/enum with `fromJson`/`toJson` — which `DartType` (a name + type args)
deliberately doesn't carry. So conversion stays on the render nodes; see the
dropped codec-extension note under **Remaining work**.

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

### Scalar JSON codec on a DartType extension (considered, dropped)

A `DartTypeCodec` extension that moved `RenderPod`'s scalar codec
(`String`/`bool`/`Uri`/`UriTemplate`, and eventually `DateTime`) off its
per-`PodType` `switch`es onto `DartType` was prototyped (PR #227) and dropped.

Two reasons it didn't earn its keep:

- **It doesn't generalize.** Conversion is a pure function of `DartType` only
  for scalars; composite/named conversion is structural (see **North star**).
  So this isn't slice-1 of a general fold — scalars are the whole of it.
- **The scalar-only win is marginal.** It replaced clear, local inline codec
  (`Uri.parse` / `.toString()`) with a centralized helper that only `RenderPod`
  called — indirection for a ~4-type table. Even completing it (folding
  `DateTime` in so the `PodType` codec `switch`es disappear) was a coin-flip
  readability win, not worth the added surface.

`RenderPod` keeps its inline per-`PodType` codec. If a *second* caller ever
appears — e.g. parameter serialization needing a scalar's wire form without a
`RenderSchema` in hand — revisit.

### Example-value generation (and its const-ness) stays off DartType

Same rule as JSON conversion, for the same reason. Generating a schema's
example value (`RenderSchema.exampleValue`, used by the round-trip tests) and
deciding whether that example is a compile-time **constant** are functions of
schema *structure*, not of `DartType`:

- Scalars are a pure function of the type (`'false'`, `DateTime.utc(2024)`,
  `Uri.parse(...)`), so const-ness *could* live on `DartType` — but that's the
  scalar-only case that #227 showed doesn't generalize.
- An object's example is `Foo(field: <field example>, ...)`, const iff its
  constructor is const (`canBeConst` = `assignmentsLine == null`, schema
  structure) **and** every field example is const (recursion over the object's
  fields). `DartType` (a name + type args) deliberately doesn't carry fields.

So when the const-example refactor happens (making the generated round-trip
tests' example instances `const` to close `prefer_const_constructors` — see the
`spec-iteration` skill's state doc), it is a `bool exampleValueIsConst(context)`
**sibling to `exampleValue` on `RenderSchema`**, recursive through composites —
not anything on `DartType`.
