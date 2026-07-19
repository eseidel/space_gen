import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitTagTagger {
  const GitTagTagger({
    required this.date,
    required this.email,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [GitTagTagger].
  factory GitTagTagger.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitTagTagger',
      json,
      () => GitTagTagger(
        date: json['date'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitTagTagger? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitTagTagger.fromJson(json);
  }

  final String date;
  final String email;
  final String name;

  /// Converts a [GitTagTagger] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'date': date, 'email': email, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([date, email, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitTagTagger &&
        date == other.date &&
        email == other.email &&
        name == other.name;
  }
}
