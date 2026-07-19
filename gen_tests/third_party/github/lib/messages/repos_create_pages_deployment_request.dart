import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_create_pages_deployment_request}
/// The object used to create GitHub Pages deployment
/// {@endtemplate}
@immutable
class ReposCreatePagesDeploymentRequest {
  /// {@macro repos_create_pages_deployment_request}
  const ReposCreatePagesDeploymentRequest({
    required this.oidcToken,
    this.artifactId,
    this.artifactUrl,
    this.environment = 'github-pages',
    this.pagesBuildVersion = 'GITHUB_SHA',
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreatePagesDeploymentRequest].
  factory ReposCreatePagesDeploymentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreatePagesDeploymentRequest',
      json,
      () => ReposCreatePagesDeploymentRequest(
        artifactId: (json['artifact_id'] as num?)?.toDouble(),
        artifactUrl: json['artifact_url'] as String?,
        environment: (json['environment'] as String?) ?? 'github-pages',
        pagesBuildVersion: json['pages_build_version'] as String,
        oidcToken: json['oidc_token'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreatePagesDeploymentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreatePagesDeploymentRequest.fromJson(json);
  }

  /// The ID of an artifact that contains the .zip or .tar of static assets to
  /// deploy. The artifact belongs to the repository. Either `artifact_id` or
  /// `artifact_url` are required.
  final double? artifactId;

  /// The URL of an artifact that contains the .zip or .tar of static assets
  /// to deploy. The artifact belongs to the repository. Either `artifact_id`
  /// or `artifact_url` are required.
  final String? artifactUrl;

  /// The target environment for this GitHub Pages deployment.
  final String? environment;

  /// A unique string that represents the version of the build for this
  /// deployment.
  final String pagesBuildVersion;

  /// The OIDC token issued by GitHub Actions certifying the origin of the
  /// deployment.
  final String oidcToken;

  /// Converts a [ReposCreatePagesDeploymentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'artifact_id': artifactId,
      'artifact_url': artifactUrl,
      'environment': environment,
      'pages_build_version': pagesBuildVersion,
      'oidc_token': oidcToken,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    artifactId,
    artifactUrl,
    environment,
    pagesBuildVersion,
    oidcToken,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreatePagesDeploymentRequest &&
        artifactId == other.artifactId &&
        artifactUrl == other.artifactUrl &&
        environment == other.environment &&
        pagesBuildVersion == other.pagesBuildVersion &&
        oidcToken == other.oidcToken;
  }
}
