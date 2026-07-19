import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssueSearchResultItemPullRequest {
  const IssueSearchResultItemPullRequest({
    required this.diffUrl,
    required this.htmlUrl,
    required this.patchUrl,
    required this.url,
    this.mergedAt,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssueSearchResultItemPullRequest].
  factory IssueSearchResultItemPullRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueSearchResultItemPullRequest',
      json,
      () => IssueSearchResultItemPullRequest(
        mergedAt: maybeParseDateTime(json['merged_at'] as String?),
        diffUrl: maybeParseUri(checkedKey(json, 'diff_url') as String?),
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
        patchUrl: maybeParseUri(checkedKey(json, 'patch_url') as String?),
        url: maybeParseUri(checkedKey(json, 'url') as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueSearchResultItemPullRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssueSearchResultItemPullRequest.fromJson(json);
  }

  final DateTime? mergedAt;
  final Uri? diffUrl;
  final Uri? htmlUrl;
  final Uri? patchUrl;
  final Uri? url;

  /// Converts an [IssueSearchResultItemPullRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'merged_at': mergedAt?.toIso8601String(),
      'diff_url': diffUrl?.toString(),
      'html_url': htmlUrl?.toString(),
      'patch_url': patchUrl?.toString(),
      'url': url?.toString(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([mergedAt, diffUrl, htmlUrl, patchUrl, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueSearchResultItemPullRequest &&
        mergedAt == other.mergedAt &&
        diffUrl == other.diffUrl &&
        htmlUrl == other.htmlUrl &&
        patchUrl == other.patchUrl &&
        url == other.url;
  }
}
