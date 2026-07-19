import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_pull_request_title}
/// Represents a 'pull_request_title' secret scanning location type. This
/// location type shows that a secret was detected in the title of a pull
/// request.
/// {@endtemplate}
@immutable
class SecretScanningLocationPullRequestTitle {
  /// {@macro secret_scanning_location_pull_request_title}
  const SecretScanningLocationPullRequestTitle({
    required this.pullRequestTitleUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationPullRequestTitle].
  factory SecretScanningLocationPullRequestTitle.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationPullRequestTitle',
      json,
      () => SecretScanningLocationPullRequestTitle(
        pullRequestTitleUrl: Uri.parse(
          json['pull_request_title_url'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationPullRequestTitle? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationPullRequestTitle.fromJson(json);
  }

  /// The API URL to get the pull request where the secret was detected.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/2846'`
  final Uri pullRequestTitleUrl;

  /// Converts a [SecretScanningLocationPullRequestTitle]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'pull_request_title_url': pullRequestTitleUrl.toString()};
  }

  @override
  int get hashCode => pullRequestTitleUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationPullRequestTitle &&
        pullRequestTitleUrl == other.pullRequestTitleUrl;
  }
}
