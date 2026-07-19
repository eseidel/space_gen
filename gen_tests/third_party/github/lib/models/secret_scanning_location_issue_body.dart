import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_issue_body}
/// Represents an 'issue_body' secret scanning location type. This location type
/// shows that a secret was detected in the body of an issue.
/// {@endtemplate}
@immutable
class SecretScanningLocationIssueBody {
  /// {@macro secret_scanning_location_issue_body}
  const SecretScanningLocationIssueBody({required this.issueBodyUrl});

  /// Converts a `Map<String, dynamic>` to a [SecretScanningLocationIssueBody].
  factory SecretScanningLocationIssueBody.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningLocationIssueBody',
      json,
      () => SecretScanningLocationIssueBody(
        issueBodyUrl: Uri.parse(json['issue_body_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationIssueBody? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationIssueBody.fromJson(json);
  }

  /// The API URL to get the issue where the secret was detected.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/1347'`
  final Uri issueBodyUrl;

  /// Converts a [SecretScanningLocationIssueBody] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'issue_body_url': issueBodyUrl.toString()};
  }

  @override
  int get hashCode => issueBodyUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationIssueBody &&
        issueBodyUrl == other.issueBodyUrl;
  }
}
