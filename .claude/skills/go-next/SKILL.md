---
name: go-next
description: |
  Pick the next thing to work on in space_gen, collision-safe. Walks
  three tiers in order — open issues, then a spec-gap discovery pass,
  then importing a new real-world spec — and stops at the first tier
  that yields good, unclaimed work. Randomizes ordering and runs the
  claim protocol so parallel agents don't collide.

  Use when asked to "go next", "what should I work on", "pick something
  to work on", "next task", "find me an issue", or any open-ended
  "keep the project moving" prompt where the specific work isn't named.
---

# go-next

Eric runs **many agents concurrently** on space_gen. The single most
important job of this skill is to pick work that **no other agent has
already started**, then claim it before writing code. A wrong pick
wastes a whole parallel session re-doing something. Bias toward the
claim checks over speed.

Walk the three tiers in order. Stop at the first tier that yields a
good, unclaimed target. Don't jump to tier 2 while good issues exist,
and don't invent a new spec while tracked specs still have gaps.

---

## The claim protocol (applies to EVERY tier)

Before touching code for a candidate — an issue, a spec gap, or a new
spec — run this, per-candidate, immediately before you commit to it.
Not once per session: the field changes minute to minute.

1. **Read the candidate's own thread.** For an issue:
   `gh issue view N --json comments --jq '.comments[].body'`. An
   `eseidel: Claiming …` comment (there can be more than one) means
   it's taken. This is the step that's easiest to skip and the one
   that catches the most collisions.
2. **Grep branches and worktrees for the area.**
   `git branch -a | grep -iE '<keywords>'` and `git worktree list`.
   A branch or worktree named for the area — especially a **locked**
   worktree — means an agent is live in it. `git -C <wt> status -s`
   confirms WIP read-only (it may be clean if they just branched; a
   checked-out, locked, area-named branch is claim enough).
3. **Check published work.** `gh pr list --state open`. Also check
   whether an open PR already churns the *files* your candidate lives
   in — even if the issue itself is unclaimed, overlapping in-flight
   work (e.g. an enum-machinery PR vs an enum issue) will conflict.
4. **Only if all clear: claim it, then work.**
   `gh issue comment N --body "Claiming — agent, worktree <branch>."`
   **before writing any code.** First claim wins. If someone claimed
   first, move on — don't race, even if your work would be further
   along. Drop a closing comment if you abandon a claim.

See the memory `feedback_claim_issue_before_starting` for the full
history (three prior collisions) behind this protocol.

## Randomize the order

Every agent that runs this skill sees the same list in the same order.
If they all take the top/freshest entry, they collide by construction.
**Shuffle before you walk.** Walk candidates in random order and take
the first one that survives the claim protocol.

```sh
# Issues in random order (number<TAB>title), newest-agnostic:
gh issue list --state open --limit 100 --json number,title \
  --jq '.[] | "\(.number)\t\(.title)"' | shuf
```

Use `shuf` (or seed variety with `$RANDOM`) rather than sorting. Don't
default to the most recently filed issue.

---

## Tier 1 — issue walk (try this first)

There is a written backlog of issues; prefer it over rediscovering
gaps from scratch.

1. List open issues and **shuffle** (command above).
2. Walk in random order. For each, run the **claim protocol**. Skip
   anything claimed, backed by a branch/worktree/PR, or overlapping an
   open PR's files.
3. Also skip issues that are **not actionable yet**: blocked on a
   precondition ("once a third detector arrives"), a vague umbrella,
   or larger than one clean PR. Prefer a well-scoped issue with a
   clear acceptance section.
4. Take the first survivor, **claim it**, then implement it following
   the `spec-iteration` skill's working rhythm and conventions (branch
   off `origin/main`, unit test on the changing layer, regen the spec
   rotation, self-review).

If every open issue is claimed, blocked, or too big → **Tier 2**.

## Tier 2 — spec-gap discovery walk

No good issue available? Find a fresh gap by mining a `-v` regen, the
way `spec-iteration` describes. **Load the `spec-iteration` skill** and
run its Discovery pass — shuffle the spec rotation too, so agents don't
all mine github:

```sh
for spec in $(printf '%s\n' api.github.com discord backstage petstore spacetraders | shuf); do
  echo "=== $spec ==="
  rm -rf /tmp/${spec//./_}_v
  dart run space_gen -v -i ~/Documents/GitHub/personal/gen_tests/${spec}.json \
    -o /tmp/${spec//./_}_v 2>&1 | tee /tmp/${spec//./_}_v.log >/dev/null
  grep -E "^(Ignoring|Unused|Skipping)" /tmp/${spec//./_}_v.log \
    | sed -E 's/ in #.*//; s/=[^[:space:]]+ /=… /; s/dynamic/…/; s/\([A-Za-z]+\)/(…)/' \
    | sort | uniq -c | sort -rn | head
done
```

A high-count category (or a remaining `UnimplementedError` stub) that
**no existing issue or branch already covers** is a gap worth taking.
Before starting: search issues (`gh issue list --search "<keywords>"`)
and branches for it — if it's untracked, **file an issue and claim it**
(so the next agent sees it); if an issue already exists, claim that.
Then implement via `spec-iteration`.

If the tracked specs are clean / every surfaced gap is already tracked
and claimed → **Tier 3**.

## Tier 3 — import a new spec

Tracked specs exhausted? Widen coverage by importing a new real-world
OpenAPI spec into the corpus as a validation target — the highest-
leverage way to surface genuinely new gaps.

- The corpus lives in `gen_tests/third_party/` (`openapi: false`, no
  quirks), gated by CI. See the memory `reference_gen_tests_tracker`
  and the import chain in issue #324 (openfoodfacts) for the mechanics
  and the `assemble` layer.
- Pick a spec that stresses features the current rotation doesn't
  (a different vendor, a split multi-document spec, unusual `format:`
  usage). Recent scouting notes live in project memories
  (`project_openai_scouting_cascade`) — check them so you don't
  re-scout the same specs.
- Importing usually surfaces a crash or ugly-output gap immediately;
  that becomes the next issue. **File and claim it** before fixing.

---

## After picking

Once a target survives the claim protocol and you've claimed it, hand
off to the normal implementation flow — the `spec-iteration` skill owns
the how (layers, tests, regen rotation, self-review, PR). This skill's
job ends at "a claimed, unclaimed-by-anyone-else target."
