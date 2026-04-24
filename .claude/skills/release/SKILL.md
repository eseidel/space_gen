---
name: release
description: |
  Prepare a space_gen release: determine the next version, generate a
  CHANGELOG section from merged PRs since the last tag, bump
  pubspec.yaml, verify, commit, tag.

  Use when asked to "release", "cut a release", "prepare a release",
  "bump the version", or "ship 1.x.y". User-triggered only — do not
  invoke proactively.
---

# Release skill for space_gen

CHANGELOG.md is generated at release time from merged PR bodies, not
edited per-PR. See `CLAUDE.md`'s "Conventions" note. This skill walks
through the release workflow.

## 1. Determine the next version

- Read `pubspec.yaml` → `version:`. That's the **current** version.
- New version bump rule (pre-1.0 convention doesn't apply — we're on
  `1.x`):
  - **patch** (`1.0.2` → `1.0.3`) — only `fix:` / `chore:` / `docs:` /
    `test:` PRs landed. The default.
  - **minor** (`1.0.2` → `1.1.0`) — any `feat:` PR landed since the
    last tag, or an intentional breaking change is being masked
    behind pre-1.0 semantics.
  - **major** — reserved for when the author decides the surface is
    stable enough to promise.
- If the right bump isn't obvious, ask the user.

## 2. Find the PRs to include

```
LAST_TAG=$(git tag --sort=-v:refname | head -1)
LAST_TAG_DATE=$(git log -1 --format=%aI "$LAST_TAG")
gh pr list --state merged --base main --limit 200 \
  --search "merged:>$LAST_TAG_DATE" \
  --json number,title,body,mergedAt
```

(If there's no existing tag yet — first release after adopting this
workflow — use the merge date of the commit that bumped the pubspec
to the current version instead. `git log pubspec.yaml` finds it.)

## 3. Extract CHANGELOG-quality bullets from each PR

For each PR returned above:

- Parse the `body` field as Markdown.
- Prefer the content under the `## Summary` heading (ending at the
  next `##`). That's the rich prose the PR author wrote.
- If there's no Summary section, fall back to the PR title (with the
  `fix:`/`feat:`/etc. prefix stripped).
- **Strip PR-only scaffolding** from the extracted body: `## Test
  plan` blocks, `## Motivating case` / `## Fix` / `## History`
  headings if they survived into the Summary area by accident, and
  `[ ]`/`[x]` checklists.

## 4. Group by conventional-commit prefix

Use the PR title's prefix (before the `:`) to bucket:

- `feat:` → **Features**
- `fix:` → **Bug fixes**
- `refactor:` → **Refactoring** (rare — often rolled into bug fixes)
- `chore:` / `test:` / `docs:` → **Chores** (usually dropped unless
  user-visible, e.g. a generator behavior change shipped as a chore)

If the prefix doesn't match any of the above (no prefix, or
something unusual), ask the user which bucket to put it in.

## 5. Write `CHANGELOG.md`

Prepend a new section immediately after the existing version's
section (if any). Current style — keep it consistent:

```
## <new-version>

### Features
- <bullet>
- <bullet>

### Bug fixes
- <bullet>
- <bullet>
```

Drop empty groups.

Preserve the existing `## 1.0.2` (or whatever the previous version
is) section verbatim — this skill only appends a new one.

## 6. Bump `pubspec.yaml`

Update the `version:` line. Nothing else in pubspec should change
here.

## 7. Verify

Run each in order; stop and surface the error if any fails:

```
dart analyze
dart test
dart pub publish --dry-run
```

## 8. Commit and tag

One commit, one tag. Don't push without explicit user confirmation —
pushing tags is an external action and must be authorized.

```
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: release $NEW_VERSION"
git tag "v$NEW_VERSION"
```

Show the user the diff and the commit before suggesting `git push
origin main --tags`. If the user has their own release-to-pub
workflow (e.g. a publish action triggered by the tag), flag that
before pushing.

## Out of scope for this skill

- **`dart pub publish`** (the real one, not dry-run) — always user-run.
- **Announcing the release** — the user can write a blurb from the
  generated CHANGELOG if they want.
- **Rollbacks** — if the release is bad, the user deletes the tag and
  issues a follow-up patch release. No rollback automation here.
