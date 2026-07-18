# Dart expression IR — decision record

**Status:** accepted; implementation in progress (#261-#265).
**Date:** 2026-07-18 (after #259).
**Sibling:** [`doc/dart_type.md`](dart_type.md) — the same argument, one layer
down, already implemented.

## Context

The generator builds Dart **expressions** by string concatenation:

```dart
'$typeName($literal)'          // constructor invocation
'<${items.typeName}>[$inner]'  // list literal
'{$key: $value}'               // map literal
"$jsonValue as $jsonType"      // cast
```

`DartType` (#222–#226) removed this for *types* — nullability is data, not a
`'$name?'` append, and `toString()` is the single rendering source of truth.
Expressions never got the same treatment. There are ~30 expression-building
members across `lib/src/render/render_tree.dart` and `lib/src/dispatch.dart`.

Two symptoms make the cost concrete.

**Derived properties have to be stored and threaded by hand.**
`ExampleValue.isConst` (#259) is the clear case. Whether an expression is a
compile-time constant is a *structural* property — a constructor invocation is
const iff its constructor is const and every argument is const — but with no
tree to derive it from, it is a `bool` field every composite must combine
correctly. Two bugs during #259 came from exactly that gap: `const` was emitted
before an enum member (`const UserRole.admin` is a syntax error, because a
static member reference is not a constructor invocation), and const-ness was
first attached to the initializer rather than the declaration, trading 987
`prefer_const_constructors` for 1486 `prefer_const_declarations`.

**Consumers recover producers' decisions by re-reading text.** Eight families,
about twenty concrete sites. Representative ones:

| site | what it does |
|---|---|
| `render_tree.dart:1249` | regex `^[a-zA-Z_$][\w$]*$` to ask "is this a bare identifier?", choosing `'$x'` vs `'${x}'` |
| `render_tree.dart:1604` | `source == 'response.body'` — recovers which branch the producer took |
| `render_tree.dart:2222` | `jsonType == 'String'` — the same question `_stringifyWireValue` (`:30`) answers structurally via `DartType` |
| `render_tree.dart:3952` | `defaultValueString(context) == example.code` — structural equality spelled as string equality |
| `render_tree.dart:1982` | `bodyContentTypeExpression == defaultBodyContentTypeExpression`, a constant that exists only to be compared |

The largest instance is not in the expression layer at all:
`lib/src/render/schema_renderer.dart` re-tokenizes fully rendered file bodies
with `RegExp(r'[a-zA-Z_$][\w$]*')` (`referencedIdentifiers`,
`_referencedModelHelpers`, `SchemaUsage.fromBody`) so that
`file_renderer.dart` can decide imports (`importsForApi:677`,
`importsForModel:776`). `SchemaUsage._validationCallPattern` is a regex
matching the exact method names `validationCalls` generates — a producer and a
consumer coupled through nothing but text. That is #250's import pruning: the
generator asking "what did I just write?" by grepping its own output.

## Decision

Build a small **home-grown sealed expression IR**
(`lib/src/render/dart_expression.dart`), reusing `DartType` for all type
references. `isConst` becomes an exhaustive `switch` over the hierarchy —
derived, never stored. Grow node types as consumers migrate, so the IR never
exists without a production user.

## Alternatives considered

### `package:code_builder` — rejected

The obvious candidate: Dart-team owned (`tools.dart.dev`), actively maintained
(4.11.1, June 2026), and its `Expression` API covers every form we emit —
literals, collection literals, `newInstance` / `constInstance`, `.property()`,
`.call()`, `.asA()`, `.conditional()`, `.ifNullThen()`.

It was rejected on the one requirement that matters: **it cannot tell you
whether an expression is constant.** `Expression.isConst` is an authoring flag
recorded at construction, not a derived property. Probed against `dart analyze`:

```
literalNum(5)                  isConst=false   // 5 is a constant
literalString('hi')            isConst=false
refer('Foo').constInstance([   isConst=true    // emits const Foo(Bar()),
  refer('Bar').newInstance([])                 // which dart analyze rejects
])                                             // (const_with_non_const)
```

It answers "did the caller type `const` here" — which we already know — and
propagates nothing from children.

Nor can const-ness be recomputed from the tree, because the tree is lossy:

- `literalNum(5)` stores the *string* `'5'` in `LiteralExpression`, which is
  also the raw-source escape hatch holding `'return'`, `'final'`, `'...'`.
  The runtime value is gone; you cannot distinguish the constant `5` from the
  keyword `return` without string-inspecting `.literal`.
- Property access, casts, `??`, ternaries, spreads and `await` are all
  `BinaryExpression(left, right, String operator)`, discriminated by an
  **operator string**. Walking means switching on strings — the same string
  typing we are trying to leave.
- `LiteralListExpression.values` is `List<Object?>`, mixing raw Dart values and
  `Expression`s; `CodeExpression` wraps arbitrary opaque source.
- `ExpressionVisitor` is documented "INTERNAL ONLY" with no recursive base
  class — ~29 stubs to implement one traversal.

Secondary costs, each individually survivable: 13 transitive packages,
including `matcher` → `test_api` in the production graph; and `asA`
unconditionally parenthesizes with no alternative, which would regress #255
(don't parenthesize a bare numeric cast in `fromJson`).

**Reconsider if** scope ever widens from expressions to whole-library
construction — classes, constructors, imports with allocators. That is where
code_builder's value actually is, and it is a separate decision.

### `package:analyzer`'s AST — rejected

A *parsing* representation built around tokens, offsets and resolution state.
Constructing nodes synthetically is painful, there is no way to render nodes
back to source, and it is a heavyweight dependency for a code *generator*.

### Other packages — none credible

`dart_code` is a hobby package (4 likes, unverified uploader) and strictly
weaker. `source_gen` / `build_runner` are build orchestration, not expression
models, and delegate to code_builder anyway.

### Hybrid: home-grown IR emitting via code_builder — rejected

Buys nothing. Emission from a sealed IR is a `switch` returning strings — the
easy half — while paying the full dependency cost and inheriting
code_builder's emission quirks (`[1, 2, ]`, forced parens on casts).

## Scope: what belongs in the IR

The test is not "is this Dart code" but **does any consumer need to know
something about it other than its text?** Every node added so far was driven by
a specific question:

| node | the question that justified it |
|---|---|
| `DartLiteral`, `DartInvocation` | can this be a compile-time constant? |
| `DartIdentifier` | is this a bare identifier, so string interpolation needs no braces? |
| `DartMethodCall`, `DartLambda` | compose without re-parsing; eventually, what does this reference? |
| `DartMapLiteral` and friends | does this expression equal that default? |

Text nobody interrogates stays text. There are three tiers, and a text
comparison is evidence something is wrong without implying the fix is always an
expression:

1. **`DartExpression`** — open-ended composed syntax where consumers ask
   structural questions. Casts, `??` and ternaries belong here as
   `fromJsonExpression` migrates.
2. **A domain type** — where the set of possibilities is fixed and small and
   the question is "which one is it". `bodyContentTypeExpression ==
   defaultBodyContentTypeExpression` is a text comparison, but the fix is an
   **enum**: an enum cannot represent nonsense, an expression can. Likewise
   `source == 'response.body'`, which wants a small sealed type naming which
   branch the producer took.
3. **A plain `String`** — statement- and declaration-level fragments nobody
   interrogates: an initializer-list entry (`this.x = x ?? default`), a
   collection-`if` element, a whole method body. These are not expressions
   grammatically, and modeling them means becoming a full AST.

**What this is not.** Not a parser — no source goes in. Not a formatter;
`dart_style` owns that. Not a full AST: no statements, no declarations, no
imports. That last boundary is load-bearing, because it is exactly the line at
which the `package:code_builder` decision above would need revisiting.

**The endgame moves this line.** Once referenced identifiers are accumulated
for import derivation, everything landing in a rendered file becomes a
candidate for modeling — which is the argument for eventually widening to
declarations, and so for reopening the code_builder question. That should be a
deliberate decision, not a drift arrived at one node at a time.

## Three things called `const`

Keeping these apart is most of the design:

- **is a constant** — actually evaluated at compile time. `5` always is;
  `Foo(1)` only when written `const Foo(1)` or placed in a constant context.
  This depends on the *destination*, so the tree cannot answer it.
- **can be const** — `DartExpression.canBeConst`. A constructor invocation
  qualifies when its constructor is declared `const` and every argument
  qualifies. `[1, 2]` qualifies even though, written bare in a runtime context,
  it allocates a fresh list each time.
- **is written `const`** — the keyword. `DartExpressionSerializer.isConstContext`
  decides it, because it is a property of where the text lands.

Two attempts at the third one failed before landing on the serializer: a
`DartConst` wrapper node (`const` is not an operator over arbitrary
expressions, so the wrapper could wrap what it must not), then a
`hasConstKeyword` field (storing a serialization decision as data on the tree).
Rendering finally moved out of the tree entirely, which is also why
`DartExpression.toString` is a debug form rather than Dart source — an
expression interpolated instead of serialized then shows up as obvious garbage
rather than plausible text.

## Consequences

**Good.** Const-ness stops being a stored field (`ExampleValue.isConst` and
`defaultCanConstConstruct` both deleted, #261 and #263). The text-comparison sites above
become structural questions or disappear. Eventually referenced identifiers are
accumulated while building rather than grepped out of rendered output, retiring
the `schema_renderer.dart` regex layer. Adding a node type becomes a compile
error at every decision point, per the project's sealed-type convention.

**Costs.** We own the model, including its emission correctness — the same
deal already taken with `DartType`. It is a long arc (~30 builders), and the
biggest payoff (import derivation) is at the end, like the `dart fix` arc
(#249–#257). Mitigation: each step improves correctness locally, and stopping
at any point leaves the codebase strictly better.

**Relationship to `DartType`.** These are the two halves of the same kernel.
`doc/dart_type.md` frames `DartType` as the `z.infer` analogue in a Dart-Zod
mapping, with schema structure on `RenderSchema`. The expression IR is the
missing piece next to it: `DartType` says what type a thing is, `DartExpression`
says what code produces a value of that type.
