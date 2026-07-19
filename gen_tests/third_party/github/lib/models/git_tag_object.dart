import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitTagObject {
  const GitTagObject({
    required this.sha,
    required this.type,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [GitTagObject].
  factory GitTagObject.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitTagObject',
      json,
      () => GitTagObject(
        sha: json['sha'] as String,
        type: json['type'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitTagObject? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitTagObject.fromJson(json);
  }

  final String sha;
  final String type;
  final Uri url;

  /// Converts a [GitTagObject] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'type': type, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([sha, type, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitTagObject &&
        sha == other.sha &&
        type == other.type &&
        url == other.url;
  }
}
