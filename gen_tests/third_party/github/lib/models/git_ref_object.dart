import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitRefObject {
  const GitRefObject({
    required this.type,
    required this.sha,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [GitRefObject].
  factory GitRefObject.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitRefObject',
      json,
      () => GitRefObject(
        type: json['type'] as String,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitRefObject? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitRefObject.fromJson(json);
  }

  final String type;

  /// SHA for the reference
  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String sha;
  final Uri url;

  /// Converts a [GitRefObject] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type, 'sha': sha, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([type, sha, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitRefObject &&
        type == other.type &&
        sha == other.sha &&
        url == other.url;
  }
}
