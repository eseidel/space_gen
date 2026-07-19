import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template release_notes_content}
/// Generated Release Notes Content
/// Generated name and body describing a release
/// {@endtemplate}
@immutable
class ReleaseNotesContent {
  /// {@macro release_notes_content}
  const ReleaseNotesContent({required this.name, required this.body});

  /// Converts a `Map<String, dynamic>` to a [ReleaseNotesContent].
  factory ReleaseNotesContent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReleaseNotesContent',
      json,
      () => ReleaseNotesContent(
        name: json['name'] as String,
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReleaseNotesContent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReleaseNotesContent.fromJson(json);
  }

  /// The generated name of the release
  /// Example: `'Release v1.0.0 is now available!'`
  final String name;

  /// The generated body describing the contents of the release supporting
  /// markdown formatting
  final String body;

  /// Converts a [ReleaseNotesContent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([name, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReleaseNotesContent &&
        name == other.name &&
        body == other.body;
  }
}
