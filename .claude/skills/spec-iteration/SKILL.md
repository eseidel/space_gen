---
name: spec-iteration
description: |
  Continue iterating space_gen against real OpenAPI specs. Each PR
  closes one gap surfaced by a real spec — could be an
  `UnimplementedError` stub, ugly generated Dart, a broken edge
  case, a missing feature, a lint that fires on generated code,
  anything that prevents the output from reading as cleanly as
  handwritten Dart. Bar: best-in-class Dart OpenAPI/Swagger
  generator.

  Use when asked to "continue space_gen work", "next gap to fix",
  "what should we improve next", "pick something to work on", or
  any spec-driven follow-up.
---

# State as of 2026-07-06 (the `dart fix` reduction arc)

This block supersedes the older sections for current status. It
documents an in-progress arc; earlier blocks are retained for
history.

## The arc: stop leaning on `dart fix`

Profiling generation speed (via the Dart VM profiler, and by
timing the internal subprocess logs) found that **`dart fix
--apply` dominates wall-clock**: ~47s of github's ~57s total, vs
~7s for space_gen's own Dart code and ~3s for the two `dart
format` passes. github is the slowest spec; discord ~23s
(fix ~14s).

**The pivotal finding: `dart fix` is _analysis-bound_, not
apply-bound.** Its cost is repeated whole-package static-analysis
passes over 1000+ files, essentially independent of how many
fixes it applies. Removing ~4,300 `unused_import` fixes (#250)
shaved only ~2.6s / 5.5% off it. So closing one lint category at
the generator gives **~no wall-clock win on its own** — the payoff
only lands at the *very end*, when every category is clean enough
that the generated package is `dart analyze`-clean without fix and
the `_runDart(['fix', ...])` call in
`lib/src/render/formatting.dart` (`Formatter.formatAndFix`) can be
deleted. Even a fully-clean package pays ~7s for `dart fix` to
confirm nothing, so dropping the call reclaims that too. Target:
github ~57s → ~10s.

`dart fix` is **load-bearing** for the "analyze-clean output"
promise: the generated package includes `very_good_analysis`, so
every category fix currently cleans would otherwise fail a
consumer's `dart analyze` (fix-disabled petstore alone has 112
issues; github ~35k). So the categories can't just be ignored —
they must be emitted clean.

Each PR in the arc moves one lint category from "laundered by
`dart fix`" to "emitted clean by the generator." Because `dart
fix` was already applying the transform, the **final post-fix
output stays byte-identical** — that's the validation gate (see
below). These are output-quality / correct-generation wins, not
individually perf wins.

## Landed this arc (all merged unless noted)

| PR | Lint closed (github raw count) | Where / fix |
|---|---|---|
| #249 | `unnecessary_this` (6307) | `==` body emitted `this.field == other.field`; drop `this.` except for a field literally named `other` (which the `Object other` param shadows — a real bug caught in A/B: `mapsEqual(other, other.other)`). `equalsExpression` + `_equalsReceiver` guard. |
| #250 | `unused_import` (4337; 97.6% model imports) | `importsForApi`/`importsForModel` imported the whole schema subtree; now gate each import on a `referencedIdentifiers(body)` token scan (mirrors `_referencedModelHelpers`). Closed the pre-existing TODO. |
| #251 | `unnecessary_brace_in_string_interps` (2014) + `unnecessary_string_interpolations` (1617) | `_pathArgLine` wrapped path params in `'${x}'`; String params substitute bare (`replaceAll('{org}', org)`), non-String interpolate braceless (`'$petId'`). One fix, two categories. |
| #252 | `noop_primitive_operations` (2045) | `.toString()` on already-`String` values: `response.body.toString()` → `response.body` (template); query/header param `_stringifyWireValue` helper; enum `toString()` gated on new `valueIsString` (int enums keep `.toString()`). |
| #253 | `prefer_const_constructors_in_immutables` (1185) | `@immutable` model ctors now `const` via `canBeConst` = `!mutableModels && assignmentsLine == null`. Smooshed variants covered (sealed parent already `const`). **Cascade:** making ctors const raised `prefer_const_constructors` at call sites (40→987, mostly generated tests) — see "what's next." |
| #254 | `always_put_required_named_parameters_first` (946) | Constructor params partitioned required-first (stable); only the ctor reorders (fields/toJson/etc. keep spec order). `entries` (additionalProperties, always required) renders between the two groups. |
| #255 | `unnecessary_parenthesis` (778) | `RenderNumeric.fromJsonExpression` wrapped bare casts: `(json['id'] as int)`. Drop parens only when no `.toDouble()` and no `?? default` (keeping `(x as int?) ?? 0` matches fix). |
| #256 | `avoid_redundant_argument_values` (681) | Three sources: `bodyContentType: BodyContentType.json` (invokeApi default — `defaultBodyContentTypeExpression` constant + `isDefaultBodyContentType` compare; the JSON body still declares json *literally*); `DateTime.utc(2024, 1, 1)` → `DateTime.utc(2024)` (month/day default to 1); example args equal to a const field default skipped in `RenderObject.exampleValue`. |
| #257 | `prefer_final_locals` (68) — **OPEN as of this writing** | Shape-dispatch `switch` patterns emitted `Map<String, dynamic> v =>` without `final`; other dispatch sections already had it. One-word template fix. |

Also this session: #246 (unintended_html lint on code spans),
#247 (regen in-repo gen_tests goldens), **#248 (release 1.3.0 —
published to pub.dev)**.

## Remaining lint tail (github, fix-disabled, after #256/#257)

~1,143 lints, **91% the const cascade**:

| count | lint | where |
|---:|---|---|
| 987 | `prefer_const_constructors` | 985 generated **tests**, 2 lib/messages |
| 169 | `prefer_const_literals_to_create_immutables` | tests |
| 18 | `unnecessary_lambdas` | |
| 11 | `unused_import` | doc-comment `[Type]` refs + meta tail |
| 9 | `prefer_int_literals` | |
| 8 | `prefer_const_declarations` | |
| 4 | `avoid_escaping_inner_quotes` | |
| 3 | `unnecessary_this` | (residual, not `==`) |
| 2 | `use_raw_strings` | |

## The const-example refactor (the big remaining lever — design settled, not started)

Closing `prefer_const_constructors` (987) + `prefer_const_literals`
(169) means making the generated round-trip tests'
example-instance construction `const` (`Widget(id: 0, name: '...')` →
`const Widget(...)`). This is the const-ctor cascade from #253.

**It does NOT need `DartType`** (a question that came up — see
`doc/dart_type.md` note added alongside this). Const-example-ness
is an *expression/structure* property, and `dart_type.md`'s North
star explicitly keeps that class of thing off `DartType` (same as
`fromJson`/`toJson`; #227 prototyped scalar-codec-on-`DartType` and
dropped it — "doesn't generalize"). `DartType` can't see an
object's fields.

**Design:** a `bool exampleValueIsConst(context)` sibling to
`exampleValue` on `RenderSchema`, recursive:

- `RenderPod`: `false` for uri/uriTemplate (`Uri.parse`,
  `UriTemplate(...)` aren't const), `true` for bool/dateTime/
  email/uuid.
- `RenderString`/`RenderNumber`/`RenderInteger`/`RenderDate`/
  `RenderEmptyObject`: `true`.
- `RenderEnum`: `false` today (`values.first` is a getter call) —
  or make it `true` by emitting the first member (`Type.member`,
  which *is* const).
- `RenderArray`/`RenderMap`: the element/value's.
- `RenderObject`: `canBeConst && every property.exampleValueIsConst
  && entries-const`.
- `RenderOneOf`: the chosen variant's; `RenderBase64Bytes`:
  `false` (`Uint8List.fromList`).

Then prefix `const` **at the outermost const-able point only** (a
`const` context makes nested literals const automatically; an
inner `const` would trip `unnecessary_const`). Watch the
round-trip template (`schema_round_trip_test.mustache`, `final
instance = {{{ exampleValue }}}`) and the object arg builder.

~15 `exampleValue` impls to touch; intricate but all in the
`Render*` layer. Entirely affects generated tests.

## What's next — an open decision the user is weighing

1. **Grind the const refactor** — biggest dent (~1,164), most
   complex, tests-only.
2. **Keep clearing small categories** — `unnecessary_lambdas`
   (18), `unused_import` doc-tail (11), `prefer_int_literals` (9),
   etc.; clean one-shots (some touch lib), but each closes little
   and the tail is long (~7 more categories) before `dart fix` can
   be dropped.
3. **Bank the wins and stop** — ~20k of the original ~35k fix
   operations already moved to the generator; the rest is a long
   thin tail that only pays off when the `dart fix` call is
   actually deleted.

Dropping `dart fix` requires **all** categories clean (the package
must be analyze-clean without it). That's the whole tail, including
the tiny categories.

## Methodology learnings (reuse these)

- **Measure raw lint counts by disabling fix.** Temporarily comment
  out the `_runDart(['fix', '.', '--apply'], ...)` line in
  `formatting.dart`, regen, `dart analyze` the output. Restore
  after. Tally: `dart analyze 2>&1 | grep -oE '[a-z_]+$' | sort |
  uniq -c | sort -rn`.
- **Byte-identical-after-fix is the validation gate.** Regen
  `origin/main` (old) vs branch (new) into two dirs, normalize the
  package name (`sed 's/package:OLD/package:PKG/'` both ways), then
  `diff -rq`. Expect 0 — *content* — differences.
- **Benign `dart_style` reflows are expected and OK.** When the
  generator emits a *shorter* expression than the old `dart fix`
  produced, `dart_style` sometimes lays it out on one line instead
  of a trailing-comma-wrapped block. A handful of files differ by
  whitespace + a trailing comma only. Confirm with: strip
  whitespace and `,)`→`)`, compare — must be identical. Seen in
  #249, #251, #255, #257.
- **`dart fix` is analysis-bound.** Don't expect a category PR to
  cut wall-clock. Proven: #250 removed 4,315 fixes, saved ~2.6s.
- **A/B diffs catch real bugs.** #249's blind `this.` strip broke a
  field named `other` (`mapsEqual(other, other.other)`); only the
  byte-diff surfaced it (fix had been *keeping* `this.other`, which
  masked the generator bug). Always A/B, don't trust "fix removed
  it so it's fine."
- **Commit messages with backticks: use `git commit -F <file>`**,
  not `-m "..."`. Backticks inside double-quoted `-m` trigger shell
  command substitution and silently eat text (`` `default: false`
  `` → empty). Same for `gh pr create --body-file`.
- **github regen is ~57s each** (fix-dominated) — two regens for an
  A/B exceed a 2-min Bash timeout; run them as separate commands.
- **Rotation after each change:** github (the bar) + discord +
  backstage + petstore + spacetraders must stay analyze-clean;
  petstore (28) + discord (1530) generated round-trip suites are
  the fast correctness check.

# State as of 2026-07-06 (Discord generated suite fully green)

The `2026-04-30` section below is retained for history; this block
supersedes it for current status.

## Headline

**Discord went from 334 `UnimplementedError` stubs + 67 failing
generated round-trip tests to 6 stubs and a 100%-passing generated
test suite** over the 2026-07-05/06 session. github stayed the bar
throughout (analyze-clean; byte-identical except two intentional
bug fixes noted below).

## Landed this session

| PR | What |
|---|---|
| #234 | Collapse the OpenAPI 3.1 nullable idiom `oneOf: [{type: null}, T]` → `T?` (resolver: the `SchemaAnyOf` null-collapse existed but `SchemaOneOf` didn't; Discord spells all 290 sites as `oneOf`). Discord 334→38 stubs. |
| #236 | Dispatch oneOf variants tagged by a `$ref`-to-enum pinned to a const (`allOf:[{$ref:E}] + enum:[v]` — the OpenAPI-3.0 "pinned enum" idiom). Parser captures the pin as `SchemaObject.constProperties`; `_tagValues` unifies it with bare-enum tags in the implicit-discriminator picker. **Also**: pinned tag renders as a fixed getter (`E get type => E.member`), not a ctor param (decision recorded in code + closed #238); and oneOf-of-consts enum members are named from spec `title:` (`AutomodActionType.blockMessage`, was `value1`). Discord 38→6 stubs. |
| #241 | Skip the bogus `toString == toJson` generated test for int enums (String vs int category error). |
| #243 | Restore int-enum `toString()` coverage #241 dropped, via a type-safe assertion (`equals(value.toJson().toString())`). |
| #244 | Decode `List<Uri>`/`List<DateTime>` via `.map((e) => parse(e))`, not a broken `.cast<Uri>()` lazy view. Root cause: list-`fromJson` gated on `createsNewType` instead of the symmetric `shouldCallToJson` that `toJson` uses. Fixed a latent github bug too (one optional, un-exercised field). Discord generated suite → 0 failures. |

## Open issues filed this session (the queue)

- **#235** — model the multi-value enum restriction `allOf:[{$ref:E}]
  + enum:[subset]` (a *restricted view* of an enum; 16 Discord sites,
  none discriminators — a field-fidelity gap, not a stub).
- **#237** — spurious `ignore_for_file:
  unintended_html_in_doc_comment` fires on `<...>` inside backtick
  code spans (`` `Map<String, dynamic>` ``). ~1145 github + 422
  Discord files carry it, mostly false positives. Fix: strip code
  spans before the tag check in `_dartdocHasHtmlTag`.
- **#239** — detect "single legal value" properties *semantically*
  (resolved-schema cardinality-1), not via the narrow `allOf`-ref
  syntax that `_constTagValue` matches. Would unify github's ~299
  bare single-value-enum tags with Discord's pinned refs and delete
  `_constTagValue` — but changes github output (a scope decision).
- **#240** — a lone scalar `const: "list"` becomes a single-value
  *enum type + file* instead of a plain constant. The non-enum
  sibling of the #236 pinned-const work.
- **#238** — CLOSED. Kept the bespoke const getter over
  final-with-default / static; rationale recorded in
  `RenderObject.constProperties`.

## Lessons worth keeping

- **Deleting a failing generated test can silently drop coverage.**
  #241 removed the int-enum `toString` test (the only caller of the
  enum's `toString()`) → `DA:0`. #243 fixed it by correcting the
  *assertion*, not removing the test. When a generated test fails,
  ask "is this the only thing exercising that generated method?"
  before deleting.
- **`createsNewType` is NOT the "needs JSON conversion" predicate;
  `shouldCallToJson` is.** They diverge for pods whose Dart type
  differs from their wire type (`Uri`/`DateTime`/`uriTemplate`).
  A `fromJson` gate must match its `toJson` gate — #244 was a
  one-directional bug from using the wrong one.
- **Recognize the semantic, not the syntax.** `_constTagValue`
  (raw-JSON `allOf`-ref matcher) is a deliberately narrow, graceful
  recognizer — fine for one idiom, but the honest model is
  cardinality-1 at the resolved-schema level (#239). Documented as
  such at the code; promote it if it needs to generalize.
- **Branch fresh off `origin/main` every PR.** Committed onto an
  already-merged branch once this session; recovered by
  cherry-picking onto a fresh branch.

## What's next (pick from here)

- **The 6 remaining Discord stubs** — genuine multi-variant unions
  (`*_actions_inner`, `*_options_inner`, `*_components_inner`,
  `error_details`) that need real dispatch (no single-tag
  discriminator). The last stub frontier.
- **The const-modeling arc** — #239 (semantic cardinality-1) is the
  keystone; #240 (lone const → plain const) rides on it.
- **#237** — cheap, high-file-count cleanup (spurious lint
  suppression); independent of everything else.
- Regenerate the `~/Documents/GitHub/personal/gen_tests` tracker
  after landing output-changing PRs (kept current through #244).

---

# State as of 2026-04-30 (Discord blockers cleared)

## What this is

space_gen is iterating toward a "fantastic" Dart OpenAPI generator.
The methodology: run real-world specs through it, see what breaks
or reads ugly, fix one thing per PR. Each PR should leave every
tracked spec at least as good as it was — ideally better.

**Validation targets** (in `~/Documents/GitHub/personal/gen_tests/`,
parallel to the repo, not checked in):

- **github** — `api.github.com.json`, ~1000 operations, the primary
  punching bag. Exercises everything (oneOf, discriminators,
  multi-status responses, big enums, recursion, status code ranges,
  complex error handling). Currently `dart analyze` clean on the
  regen with all 6100+ generated round-trip tests passing — the
  bar to maintain.
- **Discord** — `discord.json`, ~511 schemas / 141 paths. OpenAPI
  3.1. Snowflake IDs are `type: string` with a numeric pattern (so
  no int64 wire-format trap), but exposes patterns github doesn't:
  bitfield-style integer enums (132 sites, closed by #192), and
  `type: string` newtype schemas with regex patterns (327
  `validatePattern` call sites, closed by #194). Both blockers
  cleared as of 2026-04-30 — Discord regen progresses well past
  the parser-throw and the validation-call-site bug. Remaining
  failures are different gaps surfaced by the now-deeper traversal.
- **petstore** — `petstore.json`, the OpenAPI canonical example.
  Smoke test for the basics.
- **spacetraders** — `spacetraders.json`. Smaller real spec.
- **train-travel** — `train-travel.yaml`. YAML-format coverage.

There's also `private_gen_tests/watchcrunch-api.json` — a user-
reported spec used as a third-party validation target (not Eric's
own service).

A "gap" can be any of:
- `UnimplementedError` stub in generated code (always wrong).
- Generated Dart that doesn't compile, doesn't analyze clean, or
  fails its own round-trip tests.
- Output that's correct but ugly (double-prefix names, redundant
  `?`, fake oneOf wrappers, blank lines, etc.).
- Missing OpenAPI feature (cookie params, multipart edge cases,
  spec-side `nullable: true` quirks, etc.).
- A lint that fires on the generated code (`comment_references`,
  `prefer_single_quotes`, `lines_longer_than_80_chars`).
- A real-spec author hits a snag and reports it.

**Github status:** `dart analyze` clean on the regen. **3 stubs
remain** (Group C only — the enumless anyOfs the skill suggests
skipping). Stub Groups A (validation-error twins) and B (labels
requestBody) closed in PRs #177 and #183. Generated test suite:
6100+ tests, all passing — 41 round-trip-correctness bugs fixed
in #184. Smoosh series complete: #168–#170 (predicate /
discriminator / shape+hybrid dispatch), #179 (exclusive-by-use
top-level $refs), #189 (inline allOf — `RepositoryRuleDetailed`'s
21 wrappers folded into the sealed parent). Naming and dispatch
arcs settled; structural dedup of operation-synthesized oneOfs
landed in #180.

**Discord status:** Both pre-existing parser/render blockers are
now closed:

- **Integer enums (132 sites)** — closed by **#192**. Generalized
  `SchemaEnum.enumValues` from `List<String>` to a typed family
  (`SchemaStringEnum` / `SchemaIntegerEnum`) mirroring the existing
  `SchemaNumeric<T>` split. Composes with the multi-value-enum
  implicit discriminator picker from #182.
- **Pattern validation on newtype Strings (327 call sites)** —
  closed by **#194**, taking the principled route. Validation now
  lives in the newtype's own constructor (validate once at
  construction) rather than at every API call site. Required
  making synthesized example values actually satisfy their schema
  (regex-aware candidate testing for strings, range/multipleOf-
  aware for numerics) so the auto-generated round-trip tests
  don't throw `ArgumentError` from `const Foo('example')` against
  a regex newtype.

The next thing to do with Discord is **regen and assess** — the
deeper traversal will surface gaps that the parser-throw was
masking. Run a `-v` regen and tally the warnings (see "Discovery"
below).

Discord notably does NOT motivate the int64/web design call from
issue #185: their snowflake IDs are JSON strings with a numeric
pattern, not `format: int64` — they sidestepped the precision
problem by design. Only 7 int64 sites in the spec total, and one
schema is literally named `Int53Type` to acknowledge the JS limit.

**The picture beyond stubs and visible-output ugliness.** A `-v`
regen surfaces feature gaps the skill historically didn't track.
The github 2026-04-29 baseline:

| Count | Category | What | Status |
|------:|---|---|---|
| 246 | `Ignoring: format=int64 (String)` | int64 transmitted as JSON string for precision | tracked in **issue #185** (web-aware codegen — needs design) |
| 81 | `Unused: readOnly=true` | response-only fields not marked as such | tracked in **issue #186** (request/response split) |
| 19 | `Unused: x-multi-segment=true` | github vendor extension (path-segment hint) | known; `-v` log only — no action needed |
| 12 | `Ignoring: readOnly=…` (non-property slots) | readOnly outside a property — composes with #186 | tracked in **issue #186** |
| 8 | `Unused: readOnly=false` | spec noise — explicit `false` matches default | acceptable noise |
| 57 | `<Parent>OneOf<i>` wrappers in regen | naming gap — variants the heuristics don't catch | open (low priority — see "Naming polish") |
| 6 | `_1` collision suffixes | snake-name collision resolution | open (low priority) |
| 3 | enumless-anyOf stubs | Group C — skill says skip (try-each is order-dependent) | parked |
| 2 | `Ignoring: required (List<…>)` | parser drops `required: [foo]` when `foo` isn't a real property | landed in #184; the warn-log is the feature |
| various | unknown formats | `repo.nwo`, `timestamp` | open (low value) |

Gen one of these and you'll likely find more than one PR's worth
of work. **Mine the verbose log first** — see "Discovery" below
under "Open gaps". The naming/smoosh/dispatch arc has settled;
the next high-leverage tracks are issue #185 (web-aware codegen)
and issue #186 (readOnly request/response split) — both need
design passes before code.

## Architecture

The pipeline:

```
Load → Parse → Resolve → Dispatch → Naming → Render
                            │          │
                            ▼          ▼
                       sidecar lookups (Decisions, Names)
```

- **`lib/src/dispatch.dart`** (#160). Pure-structural pass: for
  each `ResolvedSchemaCollection`, picks a `DispatchDecision`
  (`Discriminator` / `Shape` / `Hybrid` / `Predicate` / `NoDispatch`).
  Variants are referenced as `ResolvedSchema`, no Dart names.
  `Predicate` IR (`KeyExists`, `ArrayElementHasKey`, `Always`) —
  adding a new predicate is a subtype, not a new mode.

- **`lib/src/naming.dart`** (#161–#163, #165, #166, #167). The
  source of truth for every Dart class name *and* every file
  basename. Single `NameAllocator` keyed by snake names; camel is
  derived via `camelFromSnake` on read. Each entity submits a
  *preference list* (best/shortest first, longest/safest last);
  the allocator runs a fixpoint that advances colliding entities to
  their next preference, then numeric-suffix-disambiguates any
  remaining ties. Order-independent.

  - **Two-phase resolution**: phase 1 claims schemas + synthesized
    op-response names; phase 2 claims wrapper subclass names (which
    depend on phase-1 resolved variant names). `AssignedNames`
    exposes both `snakeFor(pointer)` and `[]`/`maybeGet` (camel,
    derived).
  - **Title-derived names** (#167): inline oneOf/anyOf variants
    with a spec `title:` opt into a multi-tier preference list
    `[<title-snake>, <parent>_one_of_<i>]`. When the title is
    unique, the variant gets the descriptive name (file + class
    paired). github example: `org-ruleset-conditions` variants
    flip to `RepositoryNameAndRefName` etc.
  - **Doubling fallback** (#165): when a wrapper's
    `<parent><variantTag>` would double the parent prefix (because
    the parser-synthesized inline variant name already starts with
    the parent), the wrapper falls back to `<parent>Variant<i>`.

- **`SpecResolver`** (in `render_tree.dart`) consults both pre-
  passes: `decideDispatch(source)` per oneOf, and a `names=` field
  populated from `assignNames(spec)` at the start of `toRenderSpec`.
  Test helpers (`renderTestSchema`, `renderTestOperation`, …)
  populate names with `assignNamesForSchema(...)` /
  `assignNamesForOperation(...)`.

**Strict-mode invariant** (#162): `RenderSchema.typeName` and
`RenderOneOf.wrapperTypeName` throw `StateError` if the lookup is
missing. Production crashes loudly if any render path forgets to
populate names. Tests that build schemas directly without going
through `SpecResolver` must pass `assignedName: 'Foo'` explicitly.

**Resolver stays Dart-blind.** It carries `snakeName` (parser-
level) and resolves snake-name collisions with `_1` suffixes; it
knows nothing about Dart class names.

### Smoosh (the structural matrix)

For an inline `ResolvedObject` variant of a oneOf/anyOf, today's
output is **smooshed** (#168, #169, #170): the variant data class
itself extends the sealed parent, inlined in the parent's `.dart`
file, with no separate wrapper subclass and no `value:` shim.

Pattern matching destructures fields directly:

```dart
switch (req) {
  case ProjectsCreateCardRequestOneOf0(:final note):  // direct
    print(note);
}
```

instead of unwrapping `value:`:

```dart
case ProjectsCreateCardRequestVariant0(value: final v):
  print(v.note);  // pre-smoosh
```

Smoosh applies when:

1. **Structural eligibility** (`_isStructurallySmooshable`): variant
   is `ResolvedObject` AND its pointer is a child of the
   collection's pointer (so it's inline-exclusive by construction).
   `ResolvedAllOf` is excluded — it collapses to a synthesized
   `RenderObject` at render but isn't a `ResolvedObject` upstream.
2. **Render support** (`_dispatchEmitsSmooshed`): the parent
   dispatch's render template emits the smooshed form. Today this
   is exhaustive — every `DispatchDecision` kind capable of smoosh
   does it (predicate-required, discriminator, shape, hybrid Map
   sub-arms). Array-element predicate is excluded structurally
   (variants are arrays, not objects); `NoDispatch` doesn't claim
   wrappers at all.

Sealed subclasses must live in the same library — Dart's `sealed`
modifier restricts cross-library extension — so smooshed variants
are emitted **inline in the parent's `.dart` file**, not their
own. `RenderObject.parentSealedTypeName: String?` carries the
parent's class name; `RenderSchema.isSmooshed` is the check used
by the dispatch builders and `file_renderer`.

### Render-side dispatch builders

Each dispatch kind has a `_buildXMode(...)` helper on `RenderOneOf`
that splits variants into `dispatch` (per-arm `caseExpression`s),
`variants` (non-smooshed wrapper subclass declarations), and
`smooshedVariants` (full `toTemplateContext`s rendered inline via
the `schema_object` partial). The four builders follow the same
shape:

- `_buildDiscriminatorMode` — `switch (json[propertyName])`.
- `_buildShapeMode` — `switch (json) { T v => ... }`.
- `_buildHybridMode` — non-Map shape arms + Map sub-dispatch with
  optional unguarded fallback.
- `_buildPredicateMode` — if-chain (required-field or array-
  element).

Each `caseExpression` is the full Dart expression to `return` from
its switch arm — pre-composed in render code so the template just
splices it. Smooshed: `<Variant>.fromJson(<arg>)`. Non-smooshed:
`<Wrapper>(<Variant>.fromJson(<arg>))`.

## Recent PRs

The 2026-04-28/29 fan-out (12 PRs in one night, 11 landed):

| PR | What |
|---|---|
| #173 | _closed — replaced by issue #185._ Initial framing of `format=int64` was github-specific (assumed `int` was correct on VM, glossed over dart2js precision loss). |
| #174 | Handle inline `oneOf`/`anyOf` at property schema slots (precedence fix: explicit `oneOf` wins over multi-type-array expansion) |
| #175 | _closed — replaced by issues #186, #187._ readOnly doc-comment marker was a half-measure; real fix needs request/response split (#186), and the Equatable plumbing it added is the start of cleanup #187. |
| #176 | Detail-log spec-author quirks (`required` on array, `maxProperties`, etc.); drop the silent vendor-extension filter (`x-*` shows in `-v` for discoverability) |
| #177 | Dispatch validation-error twins via new `PropertyArrayItemShape` predicate; closes 2 stubs |
| #178 | Surface spec `example:` values in generated doc comments (51 sites) |
| #179 | Smoosh top-level `$ref` variants used by exactly one parent (RepositoryRule family + others; 25 fewer model files) |
| #180 | Dedup structurally-identical operation-synthesized oneOf trees (`/user` × 3 → 1; component-internal collections preserved) |
| #181 | Synthesize round-trip tests for smooshed oneOf variants |
| #182 | Don't drop `properties`/`required` when `oneOf` is a sibling (parse-time merge) + multi-value-enum implicit discriminator + propertyName-without-mapping synthesis + anyOf+discriminator plumb |
| #183 | Dispatch labels-requestBody (multi-array hybrid sub-dispatch + `_pickPropertyArrayElementShape` picker); closes 2 stubs |
| #184 | Round-trip correctness: nullable oneOf null-cast, EmptyObject delegation, additionalProperties named-key collision (`mapHash` for hashCode), parser drops `required` entries naming nonexistent properties — 41 → 0 generated test failures |

Follow-on PRs landed since (after the 2026-04-29 wave):

| PR | What |
|---|---|
| #189 | Smoosh inline allOf variants — `RepositoryRuleDetailed`'s 21 inline `allOf` oneOf variants fold into the sealed parent; structural smoosh predicate now accepts `ResolvedAllOf` for inline cases |
| #190 | Strip dead Equatable from 18 parse-tree types (`Schema` family, `Operation`, `OpenApi`, etc.); resolver/render Equatable kept (load-bearing for `_collectionCache` and `_ModelCollector`); coverage tests added pinning the load-bearing usages |
| #191 | Reframe spec-iteration skill from github-primary to a rotation across all gen_tests specs; add Discord with its blockers documented |
| #192 | Parse and render integer enums (`type: integer, enum: [...]`); typed `SchemaStringEnum` / `SchemaIntegerEnum` family. Closes Discord's first blocker |
| #194 | Synthesize valid example values + move newtype validation into the newtype's constructor (regex-aware string synthesizer; range/multipleOf-aware numeric synthesizer). Closes Discord's second blocker |

The earlier dispatch + naming + smoosh arc (#157–#170, #172):

| PR | What |
|---|---|
| #157–#160 | Dispatch mode → IR + sealed `DispatchDecision` family |
| #161–#163, #165–#167 | Naming pass introduced + multi-tier preferences + title-derived names |
| #168–#170 | Smoosh series — variant data class extends sealed parent directly under predicate / discriminator / shape+hybrid dispatch |
| #172 | Refresh skill: surface verbose-log mining as primary discovery channel |

**Stub count: 7 → 3** across the night (Groups A and B closed;
Group C parked). **Wrapper count: 49 → 57** (the 8 increase is
new variants from #182's parse-time merge — `checks_create_request`
now generates typed variant classes that previously didn't exist
as a stub). **Generated test suite: 41 broken → all 6146 pass.**

Open issues filed during the night that should drive next iteration:

- **#185** — strategy needed for web/dart2js-aware codegen
  (`format=int64` is the immediate trigger). Needs a real
  validation target with near-2^63 numeric values to motivate.
  **Discord doesn't qualify** (their snowflakes are JSON strings,
  not int64). Stripe is the next candidate to pull and check.
  Until a target lands, stay with current `int` behavior. Eric's
  preference if/when this ships: `Int64` from `package:fixnum`,
  no opt-in flag.
- **#186** — split request/response classes when properties are
  marked `readOnly: true`. Correctness issue (servers can reject
  requests with readOnly fields), not just ergonomics. Eric's
  preference: per-class duplication (`UserRequest` /
  `UserResponse`) over dual-constructor.
- **#187** — remove unused Equatable `props` from tree types.
  **Partially closed by #190**: the parse-tree (18 classes) was
  genuinely dead and got stripped. Render-tree and resolver-tree
  Equatable turned out to be load-bearing (`_collectionCache` for
  #180 dedup, `_ModelCollector` Set dedup) — kept, with explicit
  coverage tests added. The skill doc framing of "the auto-
  generated `==` is dead infrastructure" was wrong about render
  and resolver.

## Open gaps (pick from here)

### Discovery: don't pick from this list blind — regen first

Before assuming the gaps below are the right gaps, run a `-v`
regen against the spec you're targeting and tally the warnings:

```sh
spec=api.github.com  # or discord, petstore, spacetraders
rm -rf /tmp/${spec//./_}_v && \
  dart run space_gen -v -i ~/Documents/GitHub/personal/gen_tests/${spec}.json \
    -o /tmp/${spec//./_}_v 2>&1 | tee /tmp/${spec//./_}_v.log >/dev/null

grep -E "^(Ignoring|Unused|Skipping)" /tmp/${spec//./_}_v.log \
  | sed -E 's/ in #.*//; s/=[^[:space:]]+ /=… /; s/dynamic/…/; s/\([A-Za-z]+\)/(…)/' \
  | sort | uniq -c | sort -rn
```

The categories at the top of the tally are dropping spec
semantics on the floor. Pick from this *or* from the list below
— don't assume the visible-output gaps are always the highest-
leverage ones.

Warnings come from `_warnUnused` / `_warnIgnored` in
`lib/src/parser.dart`. To see what fields a parser visit *handles*
vs ignores, search there.

### Discord — what's next

Both pre-existing blockers are closed (#192 + #194). The next
useful step is: regen Discord with `-v`, tally the warnings (see
"Discovery" command above), and pick from there. Whatever now
surfaces past the deeper traversal is a feature gap that wasn't
visible while the parser was throwing.

### Tracking issues (the high-leverage tracks, partially open)

- **#185** — Strategy needed for web/dart2js-aware code generation.
  Trigger: `format=int64` (246 sites in github) silently produces
  broken code on dart2js for specs with near-2^63 IDs. Discord
  was investigated as a target and didn't qualify (snowflakes are
  JSON strings, not int64). Stripe is the next candidate — pull
  the spec, check whether amounts use int64 or string-encoding
  before coding. Eric's preference if/when this ships: `Int64`
  from `package:fixnum`, no opt-in flag.

- **#186** — Split request/response classes when properties are
  `readOnly: true`. Correctness issue: servers can reject requests
  that include readOnly fields. 81 sites in github, plus
  `Unused: readOnly=…` in `allOf` (3 more) and non-property slots
  (12 more). Eric's preference: per-class duplication
  (`UserRequest` / `UserResponse`) over dual-constructor. Should
  also handle `writeOnly: true` symmetrically. PR #175 laid the
  parser-side foundation (captures `SchemaObject.readOnlyProperties`)
  before being closed; rebuild on top of that.

- **#187** — _Partially closed by #190._ Parse-tree Equatable was
  stripped (18 classes); render-tree and resolver-tree Equatable
  are load-bearing (`_collectionCache` for #180 dedup,
  `_ModelCollector` Set dedup for file-emission dedup) and stay,
  with explicit coverage tests now pinning them.

### Smaller open gaps

- **`<Parent>Variant<i>` doubling-fallback wrapper** — only 1 left
  in github (`GistsCreateRequestPublicVariant1`, an inline string-
  enum). Down from 22 before #189. Closing that last one would
  need smoosh extending to inline `ResolvedEnum` variants too —
  unclear if worth the complexity for a single site.

- **2 `_1` collision suffixes that actually render** — `metadata_1`
  (the anyOf at `metadata.additionalProperties`, a String/num/Bool
  union) and `code_scanning_variant_analysis_status_1` (an inline
  enum that's a subset of the top-level enum with the same name).
  The resolver's snake-name collision handling appends `_1`
  mechanically; could pick a more descriptive parent-context
  disambiguator. Two other `_1` allocations (`codespace_machine_1`,
  `repository_ruleset_conditions_1` — the Group C stub) don't
  actually render their own files. Low leverage.

- **3 enumless-anyOf stubs (Group C)**: `timeline-issue-events`
  (22 variants), `issue-event-for-issue` (15), `repository-
  ruleset-conditions-1`. All variants share an `event: string`
  field but no `enum` to dispatch on. **Skill says skip** —
  try-each is order-dependent and inferring values from variant
  titles is fragile.

- **Synthesized typeName collisions.** `<op>_response` could
  collide with a schema named that way in the spec. The naming
  pass enumerates both; multi-tier preferences would let the
  synthesized name fall back to `<op>_response_2` on collision,
  but no caller currently passes that fallback list. Tiny
  widening of the op-response claim list.

- **Error-status response unions.** Multi-status dispatch only
  kicks in for 2xx variation. 4xx/5xx with structurally-different
  bodies still falls back to untyped `ApiException<Object?>`.

- **Range-mixed multi-status fallback.** When 2XX range mixes
  with explicit 2xx codes, render synthesizes a `RenderOneOf`
  with `source: null` that always emits the legacy stub. Closing
  this needs the synthesized oneOf to participate in dispatch.

- **anyOf+`additionalProperties` with `anyOf` body**. github's
  `metadata` schema. PR #174 may have already covered it via the
  precedence fix at the additionalProperties slot — verify with
  a `-v` regen check before opening a PR.

- **Unknown formats** like `repo.nwo` and `timestamp`. Low value
  to handle directly; could surface as typedef hints in doc
  comments. Probably skip until a real user asks.

## Conventions

From the project's CLAUDE.md and saved memory:

- **Bar**: "as good as handwritten" generated Dart. Push back on
  shortcuts that produce ugly output.
- **Validation target required**: pick the next PR by what real
  specs need. github is the primary punching bag.
- **Don't add a new strategy when a new predicate / candidate /
  knob will do.** The dispatch + naming + smoosh series taught
  this. Adding a 6th dispatch mode or a 5th `RenderOneOf` codepath
  is almost never the right move; extend an existing structure
  with a new variant.
- **Architectural changes ship as their own PRs first**, with
  byte-identical regen, *before* the algorithm change that
  motivated them. Pattern from the dispatch series (#158 → #159),
  the naming series (#161 → #162 → #163 → #165 → #166), and the
  smoosh series (the platform piece in each landed dispatch type
  before the next). Introduce the abstraction without behavior
  change, lock it in, then swap the algorithm in a focused diff.
- **Snake-keyed allocator, camel derived.** A snake collision IS a
  camel collision (and vice versa) — one allocator handles both.
  No parallel allocator. File names and class names share storage.
- **Sealed subclasses live in the same library** (Dart's `sealed`
  modifier requires it). Smooshed variants are emitted inline in
  the parent's `.dart` file, not their own file. The
  `rendersToSeparateFile` predicate gates per-schema file emission;
  smooshed `RenderObject`s return false.
- **Byte-identical regen as verification gate.** When a refactor
  claims no behavior change, prove it: regen
  `~/.../api.github.com.json` before and after, normalize package
  names + strip the post-format `// ignore_for_file:
  lines_longer_than_80_chars` lint header (which is package-name-
  length sensitive), then `diff -r`. Zero content diffs = clean
  lift.
- **Self-review before pushing**. Read the diff cold with two
  questions: (1) is anything here doing nothing useful (dead gates,
  speculative branches), (2) are there inline checks duplicated 3+
  times that want a helper. Eric will ask if you don't.
- **Unit tests over gen_tests**: each layer (parser, resolver,
  dispatch, naming, render) has its own unit test file. Add narrow
  unit tests on the layer changing; only add a `gen_tests/`
  fixture for genuine end-to-end coverage.
- **Don't use `!`**: bind nullable fields to a local, null-check
  the local. Same for tests — use `is` patterns or `if (x ==
  null) fail(...)` instead of postfix `!`.
- **American English**. cspell catches British spellings — use the
  American form. For coined / informal words (`smooshing`,
  `smooshable`, `smooshed`, `dispatchable`, `regen`, `unioned`,
  `fixpoint`, `prefs`, `camelization`), just add them to
  `cspell.config.yaml`. Rephrase or rename for British spellings.
- **`required` on internal types**: every constructor parameter
  on `Schema*` / `Resolved*` / `Render*` classes is `required`,
  including fields that default to null/[].
- **Sealed types over nullable-pair encodings** when a field
  encodes "exactly one of N." Examples: `OperationReturn`,
  `DispatchDecision`, `Predicate`, `_DispatchMode`.
- **Exhaustive switches on sealed types**, not if-chains, when the
  decision is mutually exclusive across known kinds. Adding a new
  subtype becomes a compile-time prompt to decide. The
  `_dispatchEmitsSmooshed` post-self-review change is the recent
  example.
- **80-col wrap** for code; loose for doc comments.
- **Don't edit CHANGELOG.md** in regular PRs — the release skill
  generates it from PR bodies.
- **Separate small PRs** ("one gap per PR") over bundled changes
  — keeps github regen diff crisp per PR.
- **Every PR branches from `origin/main`.** Never stack a new gap
  fix on top of an in-progress branch. If you accidentally stack
  (forgot to branch fresh), the cleanest recovery is to combine
  related work into one PR and update the title/description rather
  than try to untangle the git history.
- **Inline small follow-ups in the same PR — don't file separate
  issues for them.** Human review time is the expensive resource;
  every separate PR is another full review cycle. When self-
  review surfaces a small refactor or cleanup, do it now in the
  same PR. Examples folded inline during the 2026-04-29 review:
  `markUsed` API rename + four call-site updates (#182), dropping
  the dead `_collectionSnakeStem('allOf')` branch (#182), splitting
  `_pickPropertyArrayElementShape` into its own picker (#183),
  refactoring all four `_buildXMode` builders to take their
  dispatch object directly (#183), filing the parser-side `required`-
  references-unknown-property warn instead of the render-side
  `invalidJsonExample` band-aid (#184). Each was small enough to
  fit; collectively they kept the PRs at proper checkpoints.
- **Each PR is a measurable checkpoint.** Some changes legitimately
  span multiple PRs, but each one should land at a meaningful
  state, not "halfway through a refactor." If review surfaces "we're
  just a few little bits away from the checkpoint," pull those
  bits in.
- **Don't dodge symptoms with band-aids when the real fix is
  upstream.** PR #184 originally filtered `invalidJsonExample` to
  silence an asserted-throw test for github's
  `package-version-metadata-docker` typo (`required: [tags]` for a
  property called `tag`). Real fix: parser detects the unknown
  name, drops it from `requiredProperties`, and warns. Downstream
  stages then only see real names — no per-stage workarounds
  needed. Apply this everywhere: a render-time filter compensating
  for a parser-time miss is a smell.
- **Verbose-log-mining is the primary discovery channel.** The
  `-v` regen surfaces gaps that visible-output-only review misses.
  Run the tally one-shot before assuming the previously-tracked
  gap list is current — it's typically out of date by 1-2
  iterations of the project.

## Working rhythm

1. Branch off `origin/main` (`git checkout -b es/<slug>
   origin/main`). Always — even if the worktree currently sits on
   the previous PR's branch and that PR hasn't merged yet. Don't
   stack PRs. Don't `git checkout main` in this worktree (the
   primary checkout owns `main`).
2. Read the relevant layer (`lib/src/parse/`,
   `lib/src/resolver.dart`, `lib/src/dispatch.dart`,
   `lib/src/naming.dart`, `lib/src/render/render_tree.dart`,
   `lib/src/render/file_renderer.dart`, `lib/templates/*.mustache`)
   for context.
3. Add a unit test exercising the gap.
4. Make the fix in the right layer.
5. Render-layer unit tests in `test/render/render_schema_test.dart`,
   `test/render/render_operation_test.dart`, or
   `test/naming_test.dart`. Don't snapshot full template output —
   `contains()` checks read better and survive whitespace tweaks.
6. End-to-end smoke test (when warranted): write a small spec at
   `/tmp/<name>_repro/spec.json`, run `dart run space_gen -i ...
   -o ...`, verify generated code in a Dart test.
7. Regen against every tracked spec — github first (the bar to
   maintain), then the others (which surface different patterns).
   Don't ship a PR that regresses any spec already at "clean";
   for specs not yet at "clean" (Discord today), each PR should at
   least not make things worse:
   ```sh
   for spec in api.github.com discord petstore spacetraders; do
     out=/tmp/${spec//./_}_out
     rm -rf "$out"
     dart run space_gen \
       -i ~/Documents/GitHub/personal/gen_tests/${spec}.json \
       -o "$out" || echo "FAIL: $spec"
     (cd "$out" 2>/dev/null && dart analyze 2>&1 | tail -1)
   done
   ```
   github should be `No issues found!`. Others surface their own
   gaps — useful signal for picking what to burn down next.

   **Add `-v` (`--verbose`) to surface detailed warnings** that
   the default run swallows — unsupported feature usage, name
   collisions resolved by renaming, schema-shape fallbacks, etc.

8. **For "byte-identical" claims:** baseline with `git stash`,
   regen, restore, regen again, diff. The package-name-in-paths
   problem only shows up if the two output dirs have different
   names — keep the path identical (e.g. always `/tmp/github_out`)
   to avoid that source of noise.

9. Count newly-fixed sites if the PR closes a stub-emitting gap:
   ```sh
   grep -l "throw UnimplementedError" /tmp/github_out/lib -r | wc -l
   ```

10. **Self-review before pushing.** Read your diff cold. If
    something is doing nothing (dead gate, speculative branch),
    delete it. If a check is duplicated across 3+ files, extract
    a helper. If a comment claims something that's no longer true
    (`"this is a partial-rollout switch"`), update it. Eric will
    ask "self-review please" and you should already have done it.

11. Push, open PR. CI will:
    - cspell trips on coined words — add them to
      `cspell.config.yaml`. Rephrase only for British spellings.
    - codecov/patch checks new-line coverage.
    - codecov/project may fail with no-drop default — mostly an
      accounting artifact when adding lines that shift uncovered
      code's denominator. Address only if patch coverage is
      genuinely low.
    - dart format must pass.

## Don't

- Don't snapshot-match full template output in tests — fragile.
- Don't pivot to gen_tests fixtures for unit-level coverage.
- Don't use postfix `!` to silence Dart's flow analysis.
- Don't bundle multiple gap fixes in one PR — separate PRs.
- Don't merge without `dart analyze` clean on the github regen.
- Don't touch the merge-conflict-prone CHANGELOG.md in feature PRs.
- Don't conflate operation-level constructs with schema-level ones.
  (#148 made this lesson explicit: multi-status responses look
  like a oneOf but aren't.)
- Don't add a new dispatch mode / template branch / `_DispatchMode`
  subtype when a new predicate kind or new picker that builds the
  existing mode will do.
- Don't compute names in render. Naming is the source of truth;
  render reads. If a code path needs a name, it goes through
  `AssignedNames` (or a strict-mode `_requireAssignedName()`
  throws telling you why).
- Don't ship infrastructure with no production user. The
  NameAllocator multi-tier path was almost shipped untested in
  production — the mistake (a multi-tier list that was *worse*
  than single-tier in conflict) was caught in self-review. Today
  every dispatch builder is the production user of `isSmooshed`;
  multi-tier is the production user via title-based renaming. Hold
  the line.
- Don't add a smooshed-variant inline emission case for "future-
  proofing" without a concrete trigger. Removed one such
  speculative branch in #170 self-review — it would silently mis-
  render if ever reached. Better to crash on missing-case than
  silently produce wrong output.
- Don't ship "swap on better arrival" mutation in immutable caches.
  Tried this for #180's name selection: kept the cache, swapped
  the entry when a more-canonical pointer arrived. Doesn't work
  — the FIRST caller already holds the loser instance, so
  callers end up with two distinct instances and dedup silently
  fails. Either fix at parse-order time or accept first-arrival
  semantics (#180 ended up with a narrower scope rule instead).
- Don't dispatch fan-out subagents without telling them to stay
  in their assigned worktree. CLAUDE.md absolute paths can mislead
  subagents into editing the parent worktree. One agent during the
  fan-out caught itself before pushing — only because nothing else
  had uncommitted changes. Every fan-out prompt should explicitly
  say: "Edit and commit ONLY in the directory you start in (`pwd`
  to confirm). Do NOT touch the parent worktree." See memory file
  `feedback_subagent_worktree_isolation.md`.

## Helpful one-shots

```sh
# Burn-down rotation: regen each tracked spec, report analyze
# status for each. Use this to spot regressions or pick the
# next target.
for spec in api.github.com discord petstore spacetraders; do
  out=/tmp/${spec//./_}_out
  rm -rf "$out"
  dart run space_gen \
    -i ~/Documents/GitHub/personal/gen_tests/${spec}.json \
    -o "$out" 2>&1 | tail -1
  echo "$spec: $((cd "$out" 2>/dev/null && dart analyze 2>&1 | tail -1) \
    || echo 'GEN FAILED')"
done

# Discovery: tally what `-v` regen says we're dropping. Run this
# first when picking the next gap — categories at the top of the
# tally are usually higher-leverage than visible-output ugliness.
# Substitute `discord_v.log` etc. for other specs.
grep -E "^(Ignoring|Unused|Skipping)" /tmp/github_v.log \
  | sed -E 's/ in #.*//; s/=[^[:space:]]+ /=… /; s/dynamic/…/; s/\([A-Za-z]+\)/(…)/' \
  | sort | uniq -c | sort -rn

# Drill into one category — see the actual sites
grep "Unused: oneOf" /tmp/github_v.log | head -20

# Are we still emitting stubs? (works for any spec's regen dir)
grep -l "throw UnimplementedError" /tmp/github_out/lib -r | wc -l

# Sealed dispatch sites in models/
grep -l "^sealed class " /tmp/github_out/lib/models/ -r | wc -l

# Multi-status dispatch sites in api/
grep -c "switch (response.statusCode)" /tmp/github_out/lib/api/*.dart 2>/dev/null \
  | awk -F: '{ sum +=  } END { print sum }'

# Smoosh sites — variants that extend a sealed parent directly
grep -E "^final class \w+ extends \w+" /tmp/github_out/lib/messages/*.dart | wc -l

# Wrappers still using the post-#165 `Variant<i>` doubling fallback
grep -rE "class \w+Variant[0-9]+ extends \w+" /tmp/github_out/lib | wc -l

# Generated test suite — sanity check after a render-layer change
(cd /tmp/github_out && dart pub get && dart test 2>&1 | tail -3)

# Coverage for a specific file (after running ./coverage.sh)
awk '/^SF:.*\/parser.dart$/,/^end_of_record$/' coverage/lcov.info \
  | grep "DA:.*,0$"
```

```sh
# Spec-side analysis (Python is fine; the spec is JSON):
python3 -c "
import json
spec = json.load(open('$HOME/Documents/GitHub/personal/gen_tests/api.github.com.json'))
def walk(n, p):
    if isinstance(n, dict):
        if 'oneOf' in n:
            print(p, [v.get('type', 'ref') if isinstance(v, dict) else '?' for v in n['oneOf']])
        for k, v in n.items(): walk(v, p + '/' + str(k))
    elif isinstance(n, list):
        for i, x in enumerate(n): walk(x, p + '/' + str(i))
walk(spec, '')
" | head -20
```

## Where to look

- `lib/src/parser.dart`, `lib/src/parse/` — spec → Spec parse tree.
- `lib/src/resolver.dart` — Spec → ResolvedSpec, $ref + snake-name
  collision resolution. Stays Dart-blind.
- `lib/src/dispatch.dart` — `decideDispatch(ResolvedSchemaCollection)`
  per oneOf/anyOf, sealed `DispatchDecision` family + `Predicate`
  IR.
- `lib/src/naming.dart` — `assignNames(ResolvedSpec)` walks the
  resolved tree and dispatch decisions to assign every Dart class
  name. `NameAllocator` is the multi-tier preference allocator.
  `AssignedNames` exposes both `snakeFor(pointer)` and `[]`/
  `maybeGet` (camel, derived). Smoosh metadata in
  `smooshedParentSnakeByPointer` / `parentSealedTypeFor`.
- `lib/src/render/render_tree.dart` — ResolvedSpec → RenderSpec.
  `RenderOneOf._buildXMode` per dispatch kind. `RenderObject.
  parentSealedTypeName` carries the smoosh marker;
  `RenderSchema.isSmooshed` is the predicate used by builders +
  `file_renderer`.
- `lib/src/render/file_renderer.dart` — `rendersToSeparateFile`
  gates per-schema file emission (smooshed variants return false).
  Per-schema and per-API import collection.
- `lib/templates/` — Mustache templates. `schema_object.mustache`
  emits `final class X extends Y` when `parentSealedTypeName` is
  set. `schema_one_of.mustache` has four dispatch sections; each
  reads `caseExpression` per arm and includes the `schema_object`
  partial for `smooshedVariants`.
- `test/render/render_schema_test.dart`,
  `test/render/render_operation_test.dart`,
  `test/naming_test.dart` — unit tests per layer.
- `~/Documents/GitHub/personal/gen_tests/api.github.com.json` —
  primary validation target.
- `ARCHITECTURE.md` — pipeline diagram, per-phase notes, planned
  next steps. Update when phases shift.
- Issue #144 on github — running list of oneOf-specific
  follow-ups. Other gaps surface fresh from regen runs.
