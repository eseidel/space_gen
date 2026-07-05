# A generated `Date` type for `format: date`

## The problem this solves

OpenAPI distinguishes `format: date` (`YYYY-MM-DD`, RFC 3339 full-date) from
`format: date-time`. Dart has no date-only type, so the generator maps **both**
onto `DateTime`. That mapping is lossy — a date has no time or timezone, but a
`DateTime` always does — and every downstream hack exists to paper over the
loss:

- `RenderPod._valueToJsonBody` truncates `date` with
  `.toIso8601String().substring(0, 10)`.
- A parallel `maybeParseDate` helper (byte-identical to `maybeParseDateTime`)
  exists only to carry a date-specific name/dartdoc.
- `exampleValue` hand-picks a local (not UTC) `DateTime` so the truncated
  round-trip works.
- `date` vs `date-time` is the *sole* reason the pod codec can't key purely off
  `DartType`: both are `DartType.dateTime`, so the Dart type can't tell them
  apart (see the spec-type-vs-Dart-type boundary in `dart_type.md`).

All of it is one missing type. Give `date` its own Dart type and the
distinction becomes a **type** distinction: the type owns its serialization,
`RenderPod` stops special-casing, and the codec is fully DartType-determined.
This is the north-star principle stated concretely: **keep the Dart type space
1:1 with the semantically-distinct spec types.**

Apply it only where the distinction is *semantically real*. `date` earns a type
(date-only is a genuine concept). `email` vs `uuid` do **not** — they are
honestly just `String`, differing only in an example fixture; minting wrapper
types there would be strong-typing for its own sake.

## Representation (decided: extension type)

### `extension type const Date(DateTime _value)`

A generated support type emitted once per package (pruned when no `date` field
exists), owning its own JSON codec:

```dart
/// An RFC 3339 full-date (`YYYY-MM-DD`). Any [DateTime] is normalized to UTC
/// midnight on construction, so the value carries only a date — no time, no
/// timezone.
extension type Date._(DateTime value) {
  /// Normalizes any [DateTime] to UTC midnight; only the date survives.
  Date(DateTime dateTime)
    : this._(DateTime.utc(dateTime.year, dateTime.month, dateTime.day));

  factory Date.fromJson(String json) {
    final d = DateTime.parse(json);
    return Date._(DateTime.utc(d.year, d.month, d.day));
  }

  /// `YYYY-MM-DD` — the first 10 chars of ISO-8601.
  String toJson() => value.toIso8601String().substring(0, 10);
}
```

Why this one:

- **Matches the existing idiom.** Every newtype the generator emits is already
  an `extension type … ._(…)` with `fromJson`/`toJson`. `Date` is just another
  one, so it flows through the *existing* newtype codec path — a `date` field
  renders `Date`, serializes with `value.toJson()`, parses with
  `Date.fromJson(json as String)`. No new machinery.
- **Zero-cost and DateTime-interoperable.** `.value` hands back a `DateTime` for
  arithmetic/formatting; users aren't forced through a foreign calendar type.
- **Normalizes on construction**, so the date-only invariant holds *in memory*,
  not just on the wire — `Date(anyDateTime)` can't serialize wrong. Truncation
  lives in one place (`Date.toJson`) instead of at every use site.

**Timezone anchor:** normalize to **UTC** midnight, not local. `DateTime.parse`
of a bare `YYYY-MM-DD` returns *local* midnight, so without a fixed anchor the
round-trip `value == Date.fromJson(value.toJson())` fails on the timezone even
when the date matches — this is exactly why the current generator's date
example is fiddly (forced to use a *local* `DateTime` to survive the round
trip). Anchoring both construction and parse to UTC also sidesteps the
local-DST-gap edge case (locales where local midnight doesn't exist on a
spring-forward day). With normalization in place the round-trip example is just
`Date(DateTime.utc(2024, 1, 1))` — no local-vs-UTC dance.

Cost: construction runs code, so `Date` is **not** `const` (unlike the scalar
newtypes). Consistent — the generator already treats `format: date` defaults as
non-const.

### Alternative: a `Date` value class (`{int year, month, day}`)

Hard-enforces date-only and is the most "correct". Rejected as the default
because it diverges from the extension-type newtype idiom, adds real interop
friction (no `DateTime` without a conversion), and is more generated code — a
poor trade when the wire contract is already safe.

## One canonical type

There is exactly **one** date type in a generated client: `Date`. `format: date`
resolves to it everywhere — inline field or named schema, by name or by `$ref`.

Today the generator's default rule *"a named pod schema becomes its own
newtype"* mints a distinct type per named date schema (the `types` gen_test's
`DateType` is `extension type DateType._(DateTime value)`). But `date` has a
canonical Dart type, so a per-schema wrapper is a redundant layer over `Date`
— the name `DateType` is just a second word for "date." A pure-`format: date`
named schema therefore **resolves to `Date`** (no `DateType`, not even a
typedef). This is where `date` differs from `email`/`uuid`: those have no
canonical type (they're just `String`), so `EmailType`/`UuidType` at least
supply nominal identity; `date` already has `Date`.

Edge case, punted: a named date schema meant as a deliberate *nominal
distinction* (`BirthDate` ≠ `EffectiveDate`, enforced by the type system) would
keep a wrapper — but that is the same "should named pods be newtypes at all"
question as `email`/`uuid`, orthogonal to this work. Default: collapse to
`Date`. (A description on such a schema moves to the referencing field's doc.)

## How it lands in the pipeline

`Date` is a single generated support type (a static template, emitted once and
pruned when no date field exists, like `ModelHelpers`/`auth.dart`). It owns the
entire date codec — normalization, parse, truncating serialize — so nothing
else has to:

- **Parse/resolve:** `format: date` yields `PodType.date` as today, but a schema
  that is *nothing but* a date pod resolves to the `Date` type instead of a
  fresh newtype. Both inline and named date references become `Date`.
- **`RenderPod`'s date codec disappears.** A `date` field references `Date`, so
  its use sites are the standard `value.toJson()` / `Date.fromJson(json as
  String)`. The truncating serialize, `DateTime.parse`, `maybeParseDate`, and
  the local-vs-UTC example logic all move into (or are subsumed by) the one
  hand-written `Date` type. `PodType.date`'s branches in `_valueToJsonBody` /
  `_jsonToValueBody` / `fromJsonExpression` / `exampleValue` / `wrappedType`
  are removed.
- **`maybeParseDate` is deleted** — `Date.maybeFromJson` (the standard nullable
  factory) replaces it.

Net: `date` stops being a `RenderPod` special case entirely and becomes a
reference to one canonical `Date` type — the same shape as a
`format: uri-template` field referencing `UriTemplate`, except `Date` is ours.

## Output / API impact

**Public-API change** to generated clients: every `format: date` field is
`Date` instead of `DateTime`, and pure-date named schemas (e.g. `DateType`)
collapse to `Date` (their per-schema file stops being generated). A quality
improvement — one date-only type, normalized, no spurious midnight/timezone —
but user-visible, so golden fixtures update and round-trip tests exercise
`Date`.

## Validation target

The `types` gen_test already exercises a `format: date` schema (`DateType`)
end-to-end (generate → `dart format`/`fix` → round-trip). Under this change
`DateType` resolves to `Date`; keep a date field (named and/or add an inline
one) so the round-trip test exercises `Date`'s normalization across the wire.

## Decisions

- **One canonical `Date`** — `format: date` resolves to it everywhere; no
  per-schema date wrappers.
- **Representation:** `extension type Date(DateTime)` that normalizes to UTC
  midnight on construction (not `const`). Value class rejected.
- **Named pure-date schemas** resolve to `Date`; nominal-distinction wrappers
  punted with the `email`/`uuid` question.

## Open questions

1. How `Date` is emitted and how a "pure pod schema" is recognized at
   resolve/render time (so it aliases to `Date` rather than minting a newtype).
   Resolve during implementation.
2. Should `Date` expose conveniences (`year`/`month`/`day` getters, `compareTo`,
   `operator ==`) or stay minimal? Start minimal; add when a spec/user motivates
   it. (Extension-type `==` delegates to the wrapped `DateTime`, which is why
   UTC-midnight normalization matters — two `Date`s for the same day compare
   equal.)
3. Whether a matching `Time` type (`format: time`, if/when supported) follows
   the same pattern later.
