# A generated `Date` type for `format: date`

## The problem this solves

OpenAPI distinguishes `format: date` (`YYYY-MM-DD`, RFC 3339 full-date) from
`format: date-time`. Dart core has no date-only type — a long-standing gap
tracked upstream as [dart-lang/sdk#49426][sdk-date] ("[Feature request] Date
class, without time") — so the generator maps **both** onto `DateTime`. That
mapping is lossy — a date has no time or timezone, but a `DateTime` always does
— and every downstream hack exists to paper over the loss:

[sdk-date]: https://github.com/dart-lang/sdk/issues/49426

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

## Representation (decided: value class)

`Date` is a generated value class of `year`/`month`/`day` — **not** a wrapper
around `DateTime`. It's emitted once per package (pruned when no `date` field
exists) and owns its own JSON codec. The doc comment on the generated type
explains the choice so a reader isn't tempted to "simplify" it back to a
`DateTime`:

```dart
/// An RFC 3339 full-date (`YYYY-MM-DD`): a calendar day, with no time and no
/// timezone.
///
/// Deliberately a plain year/month/day value class rather than a wrapper around
/// [DateTime]. A [DateTime] is a specific *instant*, so any date backed by one
/// leaks a timezone bug that no normalization can close: stored as UTC midnight
/// it reads as the *previous day* under `.toLocal()` in negative-offset zones;
/// stored as local midnight it breaks the wire round-trip and hits the DST
/// "no midnight" gap. A date is not an instant, so this type does not hold one.
/// Converting to a [DateTime] therefore forces you to choose the timezone
/// explicitly — [toUtcDateTime] / [toLocalDateTime], no silent default.
///
/// Dart core has no date-only type (see dart-lang/sdk#49426); if it gains one,
/// this becomes an alias for it.
class Date implements Comparable<Date> {
  const Date(this.year, this.month, this.day);

  /// Parses an RFC 3339 full-date. Only the calendar components are read — the
  /// string is never treated as an instant — so the result is timezone-free.
  factory Date.fromJson(String json) {
    final dateTime = DateTime.parse(json);
    return Date(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Nullable convenience for optional fields.
  static Date? maybeFromJson(String? json) =>
      json == null ? null : Date.fromJson(json);

  final int year;
  final int month;
  final int day;

  String toJson() =>
      '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';

  /// This date at midnight UTC. You must pick the timezone; there is no default.
  DateTime toUtcDateTime() => DateTime.utc(year, month, day);

  /// This date at midnight in the local timezone.
  DateTime toLocalDateTime() => DateTime(year, month, day);

  @override
  bool operator ==(Object other) =>
      other is Date &&
      year == other.year &&
      month == other.month &&
      day == other.day;

  @override
  int get hashCode => Object.hash(year, month, day);

  /// Zero-padded `toJson` compares lexicographically == chronologically.
  @override
  int compareTo(Date other) => toJson().compareTo(other.toJson());

  @override
  String toString() => toJson();
}
```

Why the value class:

- **No timezone footgun.** The whole reason `date`-on-`DateTime` is a hazard is
  that a `DateTime` is an instant; a value class holds none, so there is nothing
  to convert wrong. Getting a `DateTime` out is explicit and names its zone.
- **`const`-constructible**, so `format: date` defaults can stay `const` — and
  structural `==`/`hashCode` mean two `Date`s for the same day are equal without
  any normalization dance.
- **Forward-compatible.** It mirrors the upstream proposal's shape
  ([dart-lang/sdk#49426][sdk-date]), so a native SDK `Date` is a drop-in later.

Cost, honestly: more generated code than an `extension type` wrapper, and `Date`
is not itself a `DateTime` (conversions are explicit). That explicitness is the
point — the type refuses to guess a timezone.

### Rejected: `extension type Date(DateTime)`

Lighter and `DateTime`-interoperable (`.value` hands back a `DateTime`), and it
matches the existing newtype idiom. Rejected because that interoperability *is*
the liability: the exposed `DateTime` is an instant, so `.value.toLocal()` is
off by a day in negative-offset zones, and no choice of anchor (UTC vs local
midnight) is safe in every direction. Normalizing on construction hides it in
memory but the leak returns the moment anyone touches the underlying instant.

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
entire date codec — parse, serialize, comparison — so nothing else has to:

- **Parse/resolve:** `format: date` yields `PodType.date` as today, but a schema
  that is *nothing but* a date pod resolves to the `Date` type instead of a
  fresh newtype. Both inline and named date references become `Date`.
- **`RenderPod`'s date codec disappears.** A `date` field references `Date`, so
  its use sites are the standard `value.toJson()` / `Date.fromJson(json as
  String)`. The truncating serialize, `DateTime.parse`, `maybeParseDate`, and
  the local-vs-UTC example logic all vanish — they're subsumed by the one
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
improvement — one timezone-free date type instead of a `DateTime` with a
spurious instant — but user-visible, so golden fixtures update and round-trip
tests exercise `Date`.

## Validation target

The `types` gen_test already exercises a `format: date` schema (`DateType`)
end-to-end (generate → `dart format`/`fix` → round-trip). Under this change
`DateType` resolves to `Date`; keep a date field (named and/or add an inline
one) so the round-trip test exercises `Date` across the wire.

## Decisions

- **One canonical `Date`** — `format: date` resolves to it everywhere; no
  per-schema date wrappers.
- **Representation:** a `year`/`month`/`day` **value class** (`const`,
  structural `==`, `Comparable`), *not* an `extension type` over `DateTime` —
  because a `DateTime` is an instant and leaks a timezone bug. The generated
  type's doc comment states this rationale.
- **Named pure-date schemas** resolve to `Date`; nominal-distinction wrappers
  punted with the `email`/`uuid` question.

## Open questions

1. How `Date` is emitted and how a "pure pod schema" is recognized at
   resolve/render time (so it aliases to `Date` rather than minting a newtype).
   Resolve during implementation.
2. `Date` ships minimal (`fromJson`/`toJson`/`maybeFromJson`, `==`/`hashCode`,
   `compareTo`, `toUtcDateTime`/`toLocalDateTime`). Further conveniences
   (`weekday`, `addDays`, `difference`) are deferred until a spec/user motivates
   them — resisting the urge to grow a date-math library.
3. Whether a matching `Time` type (`format: time`, if/when supported) follows
   the same pattern later.
4. Migration if Dart core ships a first-class date type
   ([dart-lang/sdk#49426][sdk-date]): our `Date` is a stopgap for that gap.
   Because every date field already funnels through the single `Date` type,
   swapping its implementation (or aliasing to the SDK type) would be a
   one-place change — the whole point of one canonical type.
