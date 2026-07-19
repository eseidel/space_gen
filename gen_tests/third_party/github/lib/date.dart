import 'package:meta/meta.dart';

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
/// Dart core has no date-only type (see https://github.com/dart-lang/sdk/issues/49426);
/// if it gains one, this becomes an alias for it.
@immutable
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

  /// This date at midnight UTC. You must pick the timezone; no silent default.
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

  /// Zero-padded [toJson] compares lexicographically == chronologically.
  @override
  int compareTo(Date other) => toJson().compareTo(other.toJson());

  @override
  String toString() => toJson();
}
