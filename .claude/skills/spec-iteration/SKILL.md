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

# Current state — the `dart fix` reduction arc (2026-07-06)

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

# What space_gen is / validation targets

Iterate toward a best-in-class Dart OpenAPI generator: run real
specs through it, fix one gap per PR, leave every tracked spec at
least as good as before.

**Validation targets** live in `~/Documents/GitHub/personal/gen_tests/`
(parallel to the repo, not checked in; see the external-tracker
memory). Regen each after an output-changing PR:

- **github** (`api.github.com.json`, ~1000 ops) — the primary
  punching bag and the bar: `dart analyze`-clean with all generated
  round-trip tests passing. Exercises oneOf, discriminators,
  multi-status, big enums, recursion, status-code ranges.
- **discord** (`discord.json`, ~511 schemas, OpenAPI 3.1) — integer
  enums, regex-pattern string newtypes; generated suite green
  (1530 tests), 6 genuine multi-variant-union stubs remain.
- **backstage** (`backstage.yaml`) — analyze-clean, zero stubs.
- **petstore** / **spacetraders** / **train-travel** — smoke + YAML
  coverage. Plus `private_gen_tests/watchcrunch-api.json` (a
  user-reported third-party spec).

A "gap" is any of: an `UnimplementedError` stub; generated Dart
that doesn't compile / analyze-clean / pass its round-trip tests;
correct-but-ugly output; a missing OpenAPI feature; a lint that
fires on generated code; or a real-spec author's reported snag.

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

### Backlog beyond the `dart fix` arc

Mine a `-v` regen (Discovery above) for fresh gaps first — the tally
is usually more current than any list here. Standing tracks:

- **Discord's 6 remaining stubs** — genuine multi-variant unions
  (`*_actions_inner`, `*_options_inner`, `*_components_inner`,
  `error_details`) with no single-tag discriminator; need real
  dispatch. The last stub frontier.
- **Const-modeling arc** — #239 (recognize single-legal-value
  properties by resolved-schema cardinality-1, not the narrow
  `allOf`-ref syntax `_constTagValue` matches; would delete it and
  unify github's ~299 bare single-value-enum tags with Discord's
  pinned refs, but changes github output) and #240 (a lone scalar
  `const` → a plain constant, not a single-value enum type + file).
- **#185 — web/dart2js-aware codegen.** `format: int64` (246 github
  sites) silently breaks on dart2js for near-2^63 IDs. Needs a real
  target with such values (Discord doesn't qualify — snowflakes are
  JSON strings; Stripe is the next candidate to check). Eric's
  preference: `Int64` from `package:fixnum`, no opt-in flag.
- **#186 — request/response split for `readOnly`/`writeOnly`.**
  Servers can reject requests carrying readOnly fields (81 github
  sites). Eric's preference: per-class duplication (`UserRequest` /
  `UserResponse`). PR #175 laid parser-side groundwork before being
  closed; rebuild on it.
- **Error-status response unions** — multi-status dispatch only
  handles 2xx variation; 4xx/5xx with distinct bodies still fall
  back to `ApiException<Object?>`. Related: a `2XX` range mixed with
  explicit 2xx codes synthesizes a `source: null` `RenderOneOf` that
  emits the legacy stub.

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
