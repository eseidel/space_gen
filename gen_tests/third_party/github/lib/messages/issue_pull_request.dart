import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuePullRequest {
  const IssuePullRequest({
    required this.diffUrl,
    required this.htmlUrl,
    required this.patchUrl,
    required this.url,
    this.mergedAt,
  });

  /// Converts a `Map<String, dynamic>` to an [IssuePullRequest].
  factory IssuePullRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuePullRequest',
      json,
      () => IssuePullRequest(
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
  static IssuePullRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuePullRequest.fromJson(json);
  }

  final DateTime? mergedAt;
  final Uri? diffUrl;
  final Uri? htmlUrl;
  final Uri? patchUrl;
  final Uri? url;

  /// Converts an [IssuePullRequest] to a `Map<String, dynamic>`.
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
    return other is IssuePullRequest &&
        mergedAt == other.mergedAt &&
        diffUrl == other.diffUrl &&
        htmlUrl == other.htmlUrl &&
        patchUrl == other.patchUrl &&
        url == other.url;
  }
}
