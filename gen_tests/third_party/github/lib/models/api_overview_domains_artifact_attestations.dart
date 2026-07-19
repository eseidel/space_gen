import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiOverviewDomainsArtifactAttestations {
  const ApiOverviewDomainsArtifactAttestations({
    this.trustDomain,
    this.services,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApiOverviewDomainsArtifactAttestations].
  factory ApiOverviewDomainsArtifactAttestations.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApiOverviewDomainsArtifactAttestations',
      json,
      () => ApiOverviewDomainsArtifactAttestations(
        trustDomain: json['trust_domain'] as String?,
        services: (json['services'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiOverviewDomainsArtifactAttestations? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApiOverviewDomainsArtifactAttestations.fromJson(json);
  }

  /// Example: `'example'`
  final String? trustDomain;
  final List<String>? services;

  /// Converts an [ApiOverviewDomainsArtifactAttestations]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (trustDomain != null) 'trust_domain': trustDomain,
      if (services != null) 'services': services,
    };
  }

  @override
  int get hashCode => Object.hashAll([trustDomain, listHash(services)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiOverviewDomainsArtifactAttestations &&
        trustDomain == other.trustDomain &&
        listsEqual(services, other.services);
  }
}
