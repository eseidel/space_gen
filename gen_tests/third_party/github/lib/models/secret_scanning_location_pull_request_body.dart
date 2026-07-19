import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_pull_request_body}
/// Represents a 'pull_request_body' secret scanning location type. This
/// location type shows that a secret was detected in the body of a pull
/// request.
/// {@endtemplate}
@immutable
class SecretScanningLocationPullRequestBody {
  /// {@macro secret_scanning_location_pull_request_body}
  const SecretScanningLocationPullRequestBody({
    required this.pullRequestBodyUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationPullRequestBody].
  factory SecretScanningLocationPullRequestBody.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationPullRequestBody',
      json,
      () => SecretScanningLocationPullRequestBody(
        pullRequestBodyUrl: Uri.parse(json['pull_request_body_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationPullRequestBody? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationPullRequestBody.fromJson(json);
  }

  /// The API URL to get the pull request where the secret was detected.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/2846'`
  final Uri pullRequestBodyUrl;

  /// Converts a [SecretScanningLocationPullRequestBody]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'pull_request_body_url': pullRequestBodyUrl.toString()};
  }

  @override
  int get hashCode => pullRequestBodyUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationPullRequestBody &&
        pullRequestBodyUrl == other.pullRequestBodyUrl;
  }
}
