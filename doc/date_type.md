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

## Representation (decision needed)

### Recommended: `extension type const Date(DateTime _value)`

A generated support type emitted once per package (pruned when no `date` field
exists), owning its own JSON codec:

```dart
/// An RFC 3339 full-date (`YYYY-MM-DD`). The time and timezone of the
/// underlying [DateTime] are not part of the value and are ignored.
extension type const Date._(DateTime value) {
  Date(this.value);

  factory Date.fromJson(String json) => Date(DateTime.parse(json));

  /// `YYYY-MM-DD` — the first 10 chars of ISO-8601.
  String toJson() => value.toIso8601String().substring(0, 10);
}
```

Why this one:

- **Matches the existing idiom.** Every newtype the generator emits is already
  an `extension type const … ._(…)` with `fromJson`/`toJson`. `Date` is just
  another one, so it flows through the *existing* newtype codec path — a `date`
  field renders `Date`, serializes with `value.toJson()`, parses with
  `Date.fromJson(json as String)`. No new machinery.
- **Zero-cost and DateTime-interoperable.** `.value` hands back a `DateTime` for
  arithmetic/formatting; users aren't forced through a foreign calendar type.
- **Truncation lives in one place** — `Date.toJson` — instead of at every use
  site.

Honest cost: an extension type does *not* hard-enforce date-only; a caller can
construct `Date(someDateTimeWithATime)`. We control the parse path (always
midnight from a `YYYY-MM-DD` string) and the serialize path (always truncates),
so the wire contract is safe, but the in-memory invariant is by-convention.

### Alternative: a `Date` value class (`{int year, month, day}`)

Hard-enforces date-only and is the most "correct". Rejected as the default
because it diverges from the extension-type newtype idiom, adds real interop
friction (no `DateTime` without a conversion), and is more generated code — a
poor trade when the wire contract is already safe.

## How it lands in the pipeline

- **Parse/resolve unchanged.** `format: date` still yields `PodType.date` (the
  spec-type seed).
- **Render:** `RenderPod.wrappedType` for `PodType.date` returns
  `DartType('Date')` instead of `DartType.dateTime`, and the pod behaves like a
  newtype (delegates to `Date.fromJson` / `.toJson`). The `date` branches in
  `_valueToJsonBody`, `_jsonToValueBody`, and `fromJsonExpression` **evaporate**
  — there is no truncation logic left in `RenderPod`.
- **`maybeParseDate` is deleted** (folded into `Date.maybeFromJson`, the
  standard nullable factory every newtype gets).
- **Support type emission:** a static `date.dart` (or a block in
  `model_helpers.dart`) emitted only when a `date` field is referenced, using
  the same used-set pruning as `ModelHelpers`.

Net `RenderPod` change: `date` stops being a `DateTime`-shaped inline pod and
becomes a reference to the `Date` support type — the same shape as a
`format: uri-template` field referencing `UriTemplate`.

## Output / API impact

This is a **public-API change** to generated clients: every `format: date`
field changes type from `DateTime` to `Date`. That is a quality *improvement*
(a date-only value with no spurious midnight/timezone is a real bug class
avoided), but it is user-visible, so:

- Golden fixtures with `date` fields update (expected).
- Round-trip tests exercise `Date` instead of `DateTime`.

## Validation target

Per the require-a-real-validation-target rule: before building, pick a real
spec with `format: date` fields (ubiquitous — any spec with a birthdate,
effective-date, etc.) and confirm the generated `Date` round-trips against real
server payloads. Identify the concrete spec first.

## Open questions

1. `extension type` vs value class — recommendation above is extension type;
   needs sign-off since it's a public-API commitment.
2. Where the support type lives — its own `date.dart` file vs a block in
   `model_helpers.dart`. Leaning own file (cleaner imports, matches
   `auth.dart`/`api_exception.dart`).
3. Should `Date` expose conveniences (`year`/`month`/`day` getters,
   `compareTo`, `operator ==` semantics) or stay minimal? Start minimal; add
   when a spec/user motivates it.
4. Whether a matching `Time` type (`format: time`, if/when supported) follows
   the same pattern later.
