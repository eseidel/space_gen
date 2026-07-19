// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CommitParentsInner {
  const CommitParentsInner({
    required this.sha,
    required this.url,
    this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitParentsInner].
  factory CommitParentsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitParentsInner',
      json,
      () => CommitParentsInner(
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        htmlUrl: maybeParseUri(json['html_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitParentsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitParentsInner.fromJson(json);
  }

  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String sha;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits/7638417db6d59f3c431d3e1f261cc637155684cd'`
  final Uri url;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/commit/7638417db6d59f3c431d3e1f261cc637155684cd'`
  final Uri? htmlUrl;

  /// Converts a [CommitParentsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'url': url.toString(), 'html_url': htmlUrl?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([sha, url, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitParentsInner &&
        sha == other.sha &&
        url == other.url &&
        htmlUrl == other.htmlUrl;
  }
}
