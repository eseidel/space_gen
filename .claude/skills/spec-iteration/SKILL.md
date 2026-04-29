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

# State as of 2026-04-29

## What this is

space_gen is iterating toward a "fantastic" Dart OpenAPI generator.
The methodology: run real-world specs through it, see what breaks
or reads ugly, fix one thing per PR. Validation targets:

- **Primary**: `~/Documents/GitHub/personal/gen_tests/api.github.com.json` —
  github's spec, ~1000 operations, exercises everything (oneOf,
  discriminators, multi-status responses, big enums, recursion,
  status code ranges, complex error handling). The bar is `dart
  analyze` clean on the regen.
- **Secondary**: watchcrunch (a user-reported spec — Eric's actual
  product is Shorebird, watchcrunch is a third-party validation
  target, not his service). Other specs land via gen_tests/
  fixtures when a feature needs end-to-end coverage.

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

**Current status:** **7 stubs remain** on github (unchanged — same
hard cases as before). The naming + smoosh series has shipped: 96
double-prefix wrappers fixed, ~25 wrapper subclasses eliminated
entirely (variant data class IS the sealed subclass now), and 3
inline variants flipped to title-derived names. The next leverage
is the conceptual shift to **exclusive-by-use** smoosh — see "Open
gaps" below.

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

| PR | What |
|---|---|
| #157 | Lift dispatch-mode bools into a sealed `_DispatchMode` |
| #158 | `_Predicate` IR for if-chain dispatch arms |
| #159 | Array-element dispatch via consolidated `_PredicateDispatchMode` |
| #160 | Lift dispatch picking into `decideDispatch` phase |
| #161 | Introduce naming pass and wire it through render |
| #162 | Make `assignedName` strict — `typeName` throws if missed |
| #163 | Bring oneOf wrapper subclass names under the naming pass |
| #165 | Stop doubling the parent prefix in inline oneOf wrapper names |
| #166 | Collision-aware naming via `NameAllocator` (multi-tier prefs + fixpoint) |
| #167 | Title-derived names for inline oneOf/anyOf variants; allocator stores snake |
| #168 | Smoosh inline-object variants under predicate dispatch (~13 sites) |
| #169 | Smoosh under discriminator dispatch (platform; github uses top-level refs) |
| #170 | Smoosh under shape + hybrid dispatch (~12 sites; structural matrix complete) |

Stub count remained at 7 throughout. Smoosh net: ~25 inline-object
variants flipped from wrapper-subclass to direct sealed subclass
in the github regen.

## Open gaps (pick from here)

### Next: smoosh by exclusive-use (the big remaining lever)

Today's smoosh predicate is *structural* — variant is inline
(pointer is `<parent>/oneOf/<i>`). That misses github's biggest
wrapper-subclass families because they use **top-level `$ref`
variants** referenced by exactly one parent:

- `RepositoryRule` family (~20 wrappers): `RepositoryRuleCreation`,
  `RepositoryRuleDeletion`, etc. Each top-level schema is a
  variant of `RepositoryRule` and (the more detailed)
  `RepositoryRuleDetailed`. Likely also referenced from nowhere
  else.
- `/user` × 3 sites (`oneOf<private-user, public-user>`):
  cross-cuts with the **structural-dedup** gap below — the three
  endpoints generate three structurally-identical sealed classes.
- `repos/get-content` 200 response (hybrid dispatch with
  `ContentFile`/`ContentSymlink`/`ContentSubmodule`): top-level
  refs.

Extending smoosh-eligibility to "top-level schema referenced as a
variant of exactly one parent, nowhere else" would catch all of
these. The check is real reachability analysis on the resolved
tree:

1. Walk the spec, count how many oneOf/anyOf collections include
   each top-level schema as a variant.
2. Walk again, count references *outside* of variant slots
   (property types, parameter types, request/response bodies).
3. A schema is exclusive-use iff it has exactly one variant
   reference and zero other references.

Implementation note: top-level `$ref`s resolve to the same
`ResolvedSchema` instance (via the resolver's ref cache), so
identity comparison works. Refs from one resolved schema to
another are recorded; the count is a tree walk.

The smoosh mechanism (RenderObject extends parent, inlined in
parent's file, case arm calls Variant directly) is fully built —
this PR is "widen the eligibility predicate + plumb the parent
relationship through to top-level schemas." Probably bigger than
one PR; could be:
1. Reachability analysis + `_isStructurallySmooshable` extension.
2. `parentSealedTypeName` plumbing for top-level smooshed schemas.
3. Same-library inlining (top-level schemas would move *into* the
   parent's file, eliminating their own files).

Each step has a real github-regen impact.

### Long-tail stubs (lower leverage)

7 stubs split into three groups:

**Group A — validation-error twins** (2 sites: `orgs/update` 422,
`projects/create-card` 422). `oneOf<validation-error, validation-
error-simple>` — identical at top level, distinguishable only by
`errors[].type` (object vs string). Needs a new predicate kind
that navigates into a property's array first-element type.

**Group B — labels requestBody mess** (2 sites: `issues/add-labels`,
`issues/set-labels`). 5 variants: 2× literal-duplicate
`{labels?}` object, `array<string>`, `array<object>`, `string`.
Needs upstream structural dedup + hybrid composition extending to
"array-element sub-dispatch when the outer hybrid has multiple
List variants."

**Group C — big enumless anyOfs** (3 sites: `timeline-issue-events`
22 variants, `issue-event-for-issue` 15, `repository-ruleset-
conditions-1`). All variants share an `event: string` field but no
`enum` to dispatch on. Probably right to skip — try-each is
order-dependent.

### Quality wins (mid-priority)

- **Structural dedup of identical oneOfs**. Three github `/user`
  endpoints all return `oneOf: [private-user, public-user]` with
  the same discriminator, generating 3 structurally-equal sealed
  classes (`UsersGetAuthenticated200Response`, etc.). Dedup → one
  shared `User` type. Composes with exclusive-use smoosh.

- **Per-variant round-trip test coverage for smooshed variants.**
  Smoosh removed 25 separate variant `.dart` files — and with them,
  25 round-trip test files. The variant classes still exist
  (inlined in parent), and their `fromJson`/`toJson` are unchanged,
  but no test exercises them now. Could synthesize a per-variant
  round-trip in the parent's test file.

### Tangentially related

- **Synthesized typeName collisions.** `<op>_response` could
  collide with a schema named that way in the spec. The naming
  pass enumerates both now; multi-tier preferences + the allocator
  would let the synthesized name fall back to `<op>_response_2`
  on collision, but no caller currently passes that fallback list.
  Tiny widening of the op-response claim list.

- **Error-status response unions.** Multi-status dispatch only
  kicks in for 2xx variation. 4xx/5xx with structurally-different
  bodies still falls back to untyped `ApiException<Object?>`.

- **Range-mixed multi-status fallback.** When 2XX range mixes with
  explicit 2xx codes, render synthesizes a `RenderOneOf` with
  `source: null` that always emits the legacy stub. Closing this
  needs the synthesized oneOf to participate in dispatch.

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
7. Regen against github:
   ```sh
   rm -rf /tmp/github_out && \
     dart run space_gen -i ~/Documents/GitHub/personal/gen_tests/api.github.com.json -o /tmp/github_out && \
     (cd /tmp/github_out && dart analyze)
   ```
   Should be `No issues found!`.

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

## Helpful one-shots

```sh
# Are we still emitting stubs?
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

# Top-level `$ref` variant wrappers (the next-PR target — these are
# what exclusive-by-use smoosh would catch)
grep -rE "^final class \w+(Creation|Deletion|Update|...) extends Repository" \
  /tmp/github_out/lib/models/ | wc -l
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
