import 'package:github/model_helpers.dart';
import 'package:github/models/rate_limit.dart';
import 'package:meta/meta.dart';

@immutable
class RateLimitOverviewResources {
  const RateLimitOverviewResources({
    required this.core,
    required this.search,
    this.graphql,
    this.codeSearch,
    this.sourceImport,
    this.integrationManifest,
    this.codeScanningUpload,
    this.actionsRunnerRegistration,
    this.scim,
    this.dependencySnapshots,
    this.codeScanningAutofix,
  });

  /// Converts a `Map<String, dynamic>` to a [RateLimitOverviewResources].
  factory RateLimitOverviewResources.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RateLimitOverviewResources',
      json,
      () => RateLimitOverviewResources(
        core: RateLimit.fromJson(json['core'] as Map<String, dynamic>),
        graphql: RateLimit.maybeFromJson(
          json['graphql'] as Map<String, dynamic>?,
        ),
        search: RateLimit.fromJson(json['search'] as Map<String, dynamic>),
        codeSearch: RateLimit.maybeFromJson(
          json['code_search'] as Map<String, dynamic>?,
        ),
        sourceImport: RateLimit.maybeFromJson(
          json['source_import'] as Map<String, dynamic>?,
        ),
        integrationManifest: RateLimit.maybeFromJson(
          json['integration_manifest'] as Map<String, dynamic>?,
        ),
        codeScanningUpload: RateLimit.maybeFromJson(
          json['code_scanning_upload'] as Map<String, dynamic>?,
        ),
        actionsRunnerRegistration: RateLimit.maybeFromJson(
          json['actions_runner_registration'] as Map<String, dynamic>?,
        ),
        scim: RateLimit.maybeFromJson(json['scim'] as Map<String, dynamic>?),
        dependencySnapshots: RateLimit.maybeFromJson(
          json['dependency_snapshots'] as Map<String, dynamic>?,
        ),
        codeScanningAutofix: RateLimit.maybeFromJson(
          json['code_scanning_autofix'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RateLimitOverviewResources? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RateLimitOverviewResources.fromJson(json);
  }

  /// Rate Limit
  final RateLimit core;

  /// Rate Limit
  final RateLimit? graphql;

  /// Rate Limit
  final RateLimit search;

  /// Rate Limit
  final RateLimit? codeSearch;

  /// Rate Limit
  final RateLimit? sourceImport;

  /// Rate Limit
  final RateLimit? integrationManifest;

  /// Rate Limit
  final RateLimit? codeScanningUpload;

  /// Rate Limit
  final RateLimit? actionsRunnerRegistration;

  /// Rate Limit
  final RateLimit? scim;

  /// Rate Limit
  final RateLimit? dependencySnapshots;

  /// Rate Limit
  final RateLimit? codeScanningAutofix;

  /// Converts a [RateLimitOverviewResources] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'core': core.toJson(),
      if (graphql != null) 'graphql': graphql?.toJson(),
      'search': search.toJson(),
      if (codeSearch != null) 'code_search': codeSearch?.toJson(),
      if (sourceImport != null) 'source_import': sourceImport?.toJson(),
      if (integrationManifest != null)
        'integration_manifest': integrationManifest?.toJson(),
      if (codeScanningUpload != null)
        'code_scanning_upload': codeScanningUpload?.toJson(),
      if (actionsRunnerRegistration != null)
        'actions_runner_registration': actionsRunnerRegistration?.toJson(),
      if (scim != null) 'scim': scim?.toJson(),
      if (dependencySnapshots != null)
        'dependency_snapshots': dependencySnapshots?.toJson(),
      if (codeScanningAutofix != null)
        'code_scanning_autofix': codeScanningAutofix?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    core,
    graphql,
    search,
    codeSearch,
    sourceImport,
    integrationManifest,
    codeScanningUpload,
    actionsRunnerRegistration,
    scim,
    dependencySnapshots,
    codeScanningAutofix,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RateLimitOverviewResources &&
        core == other.core &&
        graphql == other.graphql &&
        search == other.search &&
        codeSearch == other.codeSearch &&
        sourceImport == other.sourceImport &&
        integrationManifest == other.integrationManifest &&
        codeScanningUpload == other.codeScanningUpload &&
        actionsRunnerRegistration == other.actionsRunnerRegistration &&
        scim == other.scim &&
        dependencySnapshots == other.dependencySnapshots &&
        codeScanningAutofix == other.codeScanningAutofix;
  }
}
