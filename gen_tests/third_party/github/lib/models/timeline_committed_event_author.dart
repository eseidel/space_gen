import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template timeline_committed_event_author}
/// Identifying information for the git-user
/// {@endtemplate}
@immutable
class TimelineCommittedEventAuthor {
  /// {@macro timeline_committed_event_author}
  const TimelineCommittedEventAuthor({
    required this.date,
    required this.email,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineCommittedEventAuthor].
  factory TimelineCommittedEventAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineCommittedEventAuthor',
      json,
      () => TimelineCommittedEventAuthor(
        date: DateTime.parse(json['date'] as String),
        email: json['email'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCommittedEventAuthor? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineCommittedEventAuthor.fromJson(json);
  }

  /// Timestamp of the commit
  /// Example: `'2014-08-09T08:02:04+12:00'`
  final DateTime date;

  /// Git email address of the user
  /// Example: `'monalisa.octocat@example.com'`
  final String email;

  /// Name of the git user
  /// Example: `'Monalisa Octocat'`
  final String name;

  /// Converts a [TimelineCommittedEventAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'date': date.toIso8601String(), 'email': email, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([date, email, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCommittedEventAuthor &&
        date == other.date &&
        email == other.email &&
        name == other.name;
  }
}
