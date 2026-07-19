import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template git_create_tag_request_tagger}
/// An object with information about the individual creating the tag.
/// {@endtemplate}
@immutable
class GitCreateTagRequestTagger {
  /// {@macro git_create_tag_request_tagger}
  const GitCreateTagRequestTagger({
    required this.name,
    required this.email,
    this.date,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCreateTagRequestTagger].
  factory GitCreateTagRequestTagger.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateTagRequestTagger',
      json,
      () => GitCreateTagRequestTagger(
        name: json['name'] as String,
        email: json['email'] as String,
        date: maybeParseDateTime(json['date'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateTagRequestTagger? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTagRequestTagger.fromJson(json);
  }

  /// The name of the author of the tag
  final String name;

  /// The email of the author of the tag
  final String email;

  /// When this object was tagged. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? date;

  /// Converts a [GitCreateTagRequestTagger] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      if (date != null) 'date': date?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, email, date]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateTagRequestTagger &&
        name == other.name &&
        email == other.email &&
        date == other.date;
  }
}
