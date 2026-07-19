import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CommitSearchResultItemCommitTree {
  const CommitSearchResultItemCommitTree({
    required this.sha,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitSearchResultItemCommitTree].
  factory CommitSearchResultItemCommitTree.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitSearchResultItemCommitTree',
      json,
      () => CommitSearchResultItemCommitTree(
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitSearchResultItemCommitTree? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CommitSearchResultItemCommitTree.fromJson(json);
  }

  final String sha;
  final Uri url;

  /// Converts a [CommitSearchResultItemCommitTree] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([sha, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitSearchResultItemCommitTree &&
        sha == other.sha &&
        url == other.url;
  }
}
