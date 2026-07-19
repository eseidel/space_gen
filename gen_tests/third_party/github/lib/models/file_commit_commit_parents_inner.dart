import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitCommitParentsInner {
  const FileCommitCommitParentsInner({this.url, this.htmlUrl, this.sha});

  /// Converts a `Map<String, dynamic>` to a [FileCommitCommitParentsInner].
  factory FileCommitCommitParentsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitCommitParentsInner',
      json,
      () => FileCommitCommitParentsInner(
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        sha: json['sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitCommitParentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FileCommitCommitParentsInner.fromJson(json);
  }

  final String? url;
  final String? htmlUrl;
  final String? sha;

  /// Converts a [FileCommitCommitParentsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (url != null) 'url': url,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (sha != null) 'sha': sha,
    };
  }

  @override
  int get hashCode => Object.hashAll([url, htmlUrl, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitCommitParentsInner &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        sha == other.sha;
  }
}
