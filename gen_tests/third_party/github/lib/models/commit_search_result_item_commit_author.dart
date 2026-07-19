import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CommitSearchResultItemCommitAuthor {
  const CommitSearchResultItemCommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CommitSearchResultItemCommitAuthor].
  factory CommitSearchResultItemCommitAuthor.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CommitSearchResultItemCommitAuthor',
      json,
      () => CommitSearchResultItemCommitAuthor(
        name: json['name'] as String,
        email: json['email'] as String,
        date: DateTime.parse(json['date'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitSearchResultItemCommitAuthor? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CommitSearchResultItemCommitAuthor.fromJson(json);
  }

  final String name;
  final String email;
  final DateTime date;

  /// Converts a [CommitSearchResultItemCommitAuthor]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'date': date.toIso8601String()};
  }

  @override
  int get hashCode => Object.hashAll([name, email, date]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitSearchResultItemCommitAuthor &&
        name == other.name &&
        email == other.email &&
        date == other.date;
  }
}
