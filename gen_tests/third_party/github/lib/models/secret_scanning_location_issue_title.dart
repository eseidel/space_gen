import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_issue_title}
/// Represents an 'issue_title' secret scanning location type. This location
/// type shows that a secret was detected in the title of an issue.
/// {@endtemplate}
@immutable
class SecretScanningLocationIssueTitle {
  /// {@macro secret_scanning_location_issue_title}
  const SecretScanningLocationIssueTitle({required this.issueTitleUrl});

  /// Converts a `Map<String, dynamic>` to a [SecretScanningLocationIssueTitle].
  factory SecretScanningLocationIssueTitle.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningLocationIssueTitle',
      json,
      () => SecretScanningLocationIssueTitle(
        issueTitleUrl: Uri.parse(json['issue_title_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationIssueTitle? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationIssueTitle.fromJson(json);
  }

  /// The API URL to get the issue where the secret was detected.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/1347'`
  final Uri issueTitleUrl;

  /// Converts a [SecretScanningLocationIssueTitle] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'issue_title_url': issueTitleUrl.toString()};
  }

  @override
  int get hashCode => issueTitleUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationIssueTitle &&
        issueTitleUrl == other.issueTitleUrl;
  }
}
