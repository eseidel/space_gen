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

# State as of 2026-04-28

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

**Current status:** **7 stubs remain** on github. The dispatch
series has settled into a clean architecture; the visible quality
wins (96 double-prefix wrappers, 8 `_1` suffixes) are now an
algorithm-swap PR away — see "Next steps" below.

## Architecture

The pipeline has been pulled apart over the last several PRs:

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
  adding a new predicate is a subtype, not a new mode. The
  `_PredicateDispatchMode` consolidation (#159) collapsed
  required-field + array-element into one mode with five knobs.
- **`lib/src/naming.dart`** (#161, #162, #163). Walks the resolved
  tree (and dispatch decisions) to assign every Dart class name in
  one pass:
  - Top-level + inline newtype schemas (keyed by their pointer).
  - Operation-level synthesized response wrappers (keyed by op
    pointer, used by the multi-status range-mixed fallback).
  - oneOf/anyOf wrapper subclasses (keyed by
    `AssignedNames.wrapperPointer(parent, variantIndex)`).
  Today's algorithm is `camelFromSnake(snakeName)` — same answer
  the snake-derived render code used to compute. The next PR
  swaps to shortest-unique-with-fallback for the visible quality
  wins.
- **`SpecResolver`** (in `render_tree.dart`) consults both pre-
  passes: `decideDispatch(source)` per oneOf, and a `names=` field
  populated from `assignNames(spec)` at the start of `toRenderSpec`.
  Test helpers (`renderTestSchema`, `renderTestOperation`, …)
  populate names with `assignNamesForSchema(...)` /
  `assignNamesForOperation(...)`.

**Strict-mode invariant** (#162): `RenderSchema.typeName` and
`RenderOneOf.wrapperTypeName` throw `StateError` if the lookup is
missing. Production crashes loudly if any render path forgets to
populate names — no silent fallback. Tests that build schemas
directly without going through `SpecResolver` must pass
`assignedName: 'Foo'` explicitly.

**Resolver stays Dart-blind.** It carries `snakeName` (parser-
level) and resolves snake-name collisions with `_1` suffixes; it
knows nothing about Dart class names. Naming sits between resolve
and render so the resolver can be reused for any non-Dart consumer.

## Recent PRs

The dispatch / naming arc since the older state:

| PR | What |
|---|---|
| #154 | Required-field dispatch generalizes to property-presence on object oneOfs |
| #155 | Parse object schemas with required-only oneOf/anyOf as plain objects |
| #156 | Hybrid shape+required-field dispatch for mixed-shape oneOfs |
| #157 | Lift dispatch-mode bools into a sealed `_DispatchMode` |
| #158 | `_Predicate` IR for if-chain dispatch arms |
| #159 | Array-element dispatch (`anyOf<array<X>, array<Y>>`) via consolidated `_PredicateDispatchMode` |
| #160 | Lift dispatch picking into `decideDispatch` phase on the resolved tree |
| #161 | Introduce naming pass and wire it through render |
| #162 | Make `assignedName` strict — `typeName` throws if missed |
| #163 | Bring oneOf wrapper subclass names under the naming pass |

Stub count moved 9 → 7 along the way. The last four are pure
architecture (no algorithm changes, byte-identical regen).

## Open gaps (pick from here)

### Next: shortest-unique-with-fallback (the visible quality win)

The naming pass owns every Dart class name. Today it computes
`camelFromSnake(snakeName)` per entity — same as before. Swap to
**shortest-unique-with-fallback**:

For each named entity, generate candidates in preference order:
1. Property-derived bare name (for oneOf variants — pick a unique
   required field; e.g., `Note` from `note`).
2. Title-derived bare name (when the spec has a `title:`).
3. Last-segment of synthesized snake (for `_one_of_<i>` cases —
   `Variant0`).
4. `camelFromSnake(snakeName)` — today's, as final fallback.

Greedy claim in stable order: top-level component schemas first
(they already have good names from the spec), then inline schemas
in pointer order, then wrappers. Numeric suffix only when truly
collided after the candidate ladder.

**Expected regen diff:**
- ~96 wrapper classes shed the double-prefix (e.g.
  `ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0` →
  `ProjectsCreateCardRequestNote`).
- ~8 schemas shed `_1` suffixes (e.g.
  `RepositoryRulesetConditions1` → something cleaner).

This is the PR that delivers user-visible quality. The strict-mode
invariant from #162 + global naming view from #163 mean any
algorithm bug shows up as a regen diff or crash — no silent
regression.

### Long-tail stubs (lower leverage)

7 stubs split into three groups (per regen on `origin/main`):

**Group A — validation-error twins** (2 sites:
`orgs/update` 422, `projects/create-card` 422). `oneOf<validation-
error, validation-error-simple>` — identical at top level
(same required `[documentation_url, message]`, same props),
distinguishable only by `errors[].type` (object vs string). Needs
a new predicate kind that navigates into a property's array first-
element type. Caveat: relies on server emitting `errors`.

**Group B — labels requestBody mess** (2 sites: `issues/add-labels`,
`issues/set-labels`). 5 variants: 2× literal-duplicate
`{labels?}` object, `array<string>`, `array<object>`, `string`.
Needs upstream structural dedup (the 2 identical objects are a
spec-author bug) + hybrid composition extending to
"array-element sub-dispatch when the outer hybrid has multiple
List variants." Two architectural changes.

**Group C — big enumless anyOfs** (3 sites: `timeline-issue-events`
22 variants, `issue-event-for-issue` 15, `repository-ruleset-
conditions-1`). All variants share an `event: string` field but
no `enum` to dispatch on. Probably right to skip — leave as stubs
with a verbose warning. Inferring values from variant titles is
fragile; try-each is order-dependent.

### Quality wins (lower priority once shortest-unique lands)

- **Structural dedup of identical oneOfs.** Three github `/user`
  endpoints all return `oneOf: [private-user, public-user]` with
  the same discriminator. Today they generate 3 structurally-equal
  sealed classes (`UsersGetAuthenticated200Response`, etc.). Dedup
  → one shared `User` type. Composes with shortest-unique once it
  lands.

### Tangentially related

- **Synthesized typeName collisions.** `<op>_response` could
  collide with a schema named that way in the spec. The naming
  pass enumerates both now (under different keys), so a future
  collision-resolution pass over `AssignedNames` can detect and
  resolve.
- **Error-status response unions.** Multi-status dispatch only
  kicks in for 2xx variation. 4xx/5xx with structurally-different
  bodies still falls back to untyped `ApiException<Object?>` when
  the error schemas don't dedupe. Could extend `OperationReturn`
  (or add a parallel `ErrorShape`) to dispatch on error status
  too.
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
  knob will do.** The dispatch series taught this — see #156–#159
  for the consolidation arc and #163 for naming. Adding a 6th
  dispatch mode or a 5th `RenderOneOf` codepath is almost never
  the right move; extend an existing structure with a new
  variant.
- **Byte-identical regen as verification gate.** When a refactor
  claims no behavior change, prove it: regen `~/.../api.github.com.json`
  before and after, normalize package names + strip the post-
  format `// ignore_for_file: lines_longer_than_80_chars` lint
  header (which is package-name-length sensitive), then `diff -r`.
  Zero content diffs = clean lift.
- **Unit tests over gen_tests**: each layer (parser, resolver,
  dispatch, naming, render) has its own unit test file. Add
  narrow unit tests on the layer changing; only add a `gen_tests/`
  fixture for genuine end-to-end coverage (those run dart format
  + dart fix on every CI).
- **Don't use `!`**: bind nullable fields to a local, null-check
  the local. Same for tests — use `is` patterns or `if (x ==
  null) fail(...)` instead of postfix `!`.
- **American English**. cspell will trip on British spellings
  (`customise`, `behaviour`, `parameterise`); use American forms.
  For coined / informal words (`smooshing`, `dispatchable`,
  `regen`, `unioned`), just add them to `cspell.config.yaml` —
  rephrase only for British spellings or if the word is just an
  abbreviation (e.g. `addl` → rename the local to `extraProps`).
- **`required` on internal types**: every constructor parameter
  on `Schema*` / `Resolved*` / `Render*` classes is `required`,
  including fields that default to null/[]. CLAUDE.md explains
  why (silent drops in the pipeline).
- **Sealed types over nullable-pair encodings** when a field
  encodes "exactly one of N." Examples: `OperationReturn`,
  `DispatchDecision`, `Predicate`.
- **80-col wrap** for code; loose for doc comments.
- **Don't edit CHANGELOG.md** in regular PRs — the release skill
  generates it from PR bodies.
- **Separate small PRs** ("one gap per PR") over bundled changes
  — keeps github regen diff crisp per PR.
- **Every PR branches from `origin/main`.** Never stack a new gap
  fix on top of an in-progress branch. If the worktree is sitting
  on the previous PR's branch, start a fresh branch off
  `origin/main` before touching code — even if that previous PR
  hasn't merged yet.
- **Architectural changes ship as their own PRs first**, with
  byte-identical regen, *before* the algorithm change that
  motivated them. Pattern from the dispatch series (#158 → #159)
  and the naming series (#161 → #162 → #163 → next): introduce
  the abstraction without behavior change, lock it in, then swap
  the algorithm in a focused diff.

## Working rhythm

1. Branch off `origin/main` (`git checkout -b es/<slug>
   origin/main`). Always — even if the worktree currently sits on
   the previous PR's branch and that PR hasn't merged yet. Don't
   stack PRs. Don't `git checkout main` in this worktree (the
   primary checkout owns `main`).
2. Read the relevant layer (`lib/src/parse/`,
   `lib/src/resolver.dart`, `lib/src/dispatch.dart`,
   `lib/src/naming.dart`, `lib/src/render/render_tree.dart`)
   for context.
3. Add a unit test exercising the gap.
4. Make the fix in the right layer.
5. Render-layer unit tests in
   `test/render/render_schema_test.dart` or
   `test/render/render_operation_test.dart`. Don't snapshot full
   template output — `contains()` checks read better and survive
   whitespace tweaks.
6. End-to-end smoke test (when warranted): write a small spec at
   `/tmp/<name>_repro/spec.json`, run `dart run space_gen -i ...
   -o ...`, verify generated code in a Dart test.
7. Regen against github:
   ```sh
   rm -rf /tmp/github_out && \
     dart run space_gen -i ~/Documents/GitHub/personal/gen_tests/api.github.com.json -o /tmp/github_out && \
     (cd /tmp/github_out && dart analyze)
   ```
   Should be `No issues found!`. If not, the new code is breaking
   real specs — fix before pushing.

   **Add `-v` (`--verbose`) to surface detailed warnings** that
   the default run swallows — unsupported feature usage, name
   collisions resolved by renaming, schema-shape fallbacks, etc.

8. **For "byte-identical" claims:** run the diff harness. Saves a
   baseline regen on `origin/main`, regen with your branch,
   normalize, strip the lint-header artifact, walk diffs:

   ```sh
   # baseline (on a clean tree of origin/main)
   git stash && rm -rf /tmp/g_main && \
     dart run space_gen -i ~/Documents/GitHub/personal/gen_tests/api.github.com.json -o /tmp/g_main && \
     git stash pop

   # your branch
   rm -rf /tmp/g_branch && \
     dart run space_gen -i ~/Documents/GitHub/personal/gen_tests/api.github.com.json -o /tmp/g_branch

   # diff with normalization
   mkdir -p /tmp/db /tmp/da
   cp -r /tmp/g_main/. /tmp/db/
   cp -r /tmp/g_branch/. /tmp/da/
   find /tmp/db -type f \( -name '*.dart' -o -name '*.yaml' -o -name '*.json' \) -exec sed -i '' 's|g_main|GG|g' {} +
   find /tmp/da -type f \( -name '*.dart' -o -name '*.yaml' -o -name '*.json' \) -exec sed -i '' 's|g_branch|GG|g' {} +
   strip_header() { awk 'NR==1 && /^\/\/ Some OpenAPI specs flatten inline schemas/ { skip=4 } skip>0 { skip--; next } { print }' "$1"; }
   real=0
   for f in $(diff -rq /tmp/db /tmp/da 2>&1 | grep '^Files' | awk '{print $2}'); do
     rel=${f#/tmp/db}
     if ! diff <(strip_header /tmp/db$rel) <(strip_header /tmp/da$rel) > /dev/null 2>&1; then
       echo "REAL: $rel"; real=$((real+1))
     fi
   done
   echo "---real: $real---"
   ```

   The lint-header artifact is package-name-length sensitive; strip
   it or normalize the package-name lengths to match.

9. Count newly-fixed sites if the PR closes a stub-emitting gap:
   ```sh
   grep -l "throw UnimplementedError" /tmp/github_out/lib -r | wc -l
   ```

10. Push, open PR. CI will:
    - cspell trips on coined words — add them to
      `cspell.config.yaml`. Rephrase only for British spellings.
    - codecov/patch checks new-line coverage. New files often need
      a few targeted unit tests — naming.dart was at ~88% before
      adding 5 more tests to hit the throw / `entries` / map /
      anyOf-allOf paths.
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
- Don't touch the merge-conflict-prone CHANGELOG.md in feature
  PRs.
- Don't conflate operation-level constructs with schema-level
  ones. (#148 made this lesson explicit: multi-status responses
  look like a oneOf but aren't.)
- Don't add a new dispatch mode / template branch / `_DispatchMode`
  subtype when a new predicate kind or new picker that builds the
  existing mode will do. Strategy proliferation is the
  anti-pattern.
- Don't compute names in render. Naming is the source of truth;
  render reads. If a code path needs a name, it goes through
  `AssignedNames` (or a strict-mode `_requireAssignedName()`
  throws telling you why).

## Helpful one-shots

```sh
# Are we still emitting stubs?
grep -l "throw UnimplementedError" /tmp/github_out/lib -r | wc -l

# Sealed dispatch sites in models/
grep -l "^sealed class " /tmp/github_out/lib/models/ -r | wc -l

# Multi-status dispatch sites in api/
grep -c "switch (response.statusCode)" /tmp/github_out/lib/api/*.dart 2>/dev/null \
  | awk -F: '{ sum +=  } END { print sum }'

# Double-prefix wrapper sites (the 96-class smoosh target)
grep -rE "class [A-Z][a-zA-Z]+OneOf[0-9]" /tmp/github_out/lib | wc -l

# Schemas with `_1` collision suffixes
grep -rl "class [A-Z][a-zA-Z]*1 " /tmp/github_out/lib/models/ | wc -l
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

- `lib/src/parser.dart`, `lib/src/parse/` — spec → Spec parse
  tree.
- `lib/src/resolver.dart` — Spec → ResolvedSpec, $ref + snake-name
  collision resolution. Stays Dart-blind.
- `lib/src/dispatch.dart` — `decideDispatch(ResolvedSchemaCollection)`
  per oneOf/anyOf, sealed `DispatchDecision` family + `Predicate`
  IR.
- `lib/src/naming.dart` — `assignNames(ResolvedSpec)` walks the
  resolved tree (and dispatch decisions) to assign every Dart
  class name. `assignNamesForSchema` / `assignNamesForOperation`
  for partial trees. `AssignedNames.wrapperPointer(parent, i)`
  for wrapper subclass keys.
- `lib/src/render/render_tree.dart` — ResolvedSpec → RenderSpec.
  `RenderOneOf` reads `decideDispatch(source)` and `wrapperNames`
  (looked up from naming via `_wrapperNamesFor`). `typeName` /
  `wrapperTypeName` are strict lookups, not computations.
- `lib/templates/` — Mustache templates. Schema templates,
  api.mustache, partials.
- `test/render/render_schema_test.dart`,
  `test/render/render_operation_test.dart`,
  `test/naming_test.dart` — unit tests per layer.
- `~/Documents/GitHub/personal/gen_tests/api.github.com.json` —
  primary validation target.
- `ARCHITECTURE.md` — pipeline diagram, per-phase notes, planned
  next steps. Update when phases shift.
- Issue #144 on github — running list of oneOf-specific
  follow-ups. Other gaps surface fresh from regen runs.
