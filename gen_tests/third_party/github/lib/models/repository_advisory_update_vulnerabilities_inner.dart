import 'package:github/model_helpers.dart';
import 'package:github/models/repository_advisory_update_vulnerabilities_inner_package.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryUpdateVulnerabilitiesInner {
  const RepositoryAdvisoryUpdateVulnerabilitiesInner({
    required this.package,
    this.vulnerableVersionRange,
    this.patchedVersions,
    this.vulnerableFunctions,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryAdvisoryUpdateVulnerabilitiesInner].
  factory RepositoryAdvisoryUpdateVulnerabilitiesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryAdvisoryUpdateVulnerabilitiesInner',
      json,
      () => RepositoryAdvisoryUpdateVulnerabilitiesInner(
        package: RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.fromJson(
          json['package'] as Map<String, dynamic>,
        ),
        vulnerableVersionRange: json['vulnerable_version_range'] as String?,
        patchedVersions: json['patched_versions'] as String?,
        vulnerableFunctions: (json['vulnerable_functions'] as List?)
            ?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryUpdateVulnerabilitiesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryUpdateVulnerabilitiesInner.fromJson(json);
  }

  /// The name of the package affected by the vulnerability.
  final RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage package;

  /// The range of the package versions affected by the vulnerability.
  final String? vulnerableVersionRange;

  /// The package version(s) that resolve the vulnerability.
  final String? patchedVersions;

  /// The functions in the package that are affected.
  final List<String>? vulnerableFunctions;

  /// Converts a [RepositoryAdvisoryUpdateVulnerabilitiesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'package': package.toJson(),
      'vulnerable_version_range': vulnerableVersionRange,
      'patched_versions': patchedVersions,
      'vulnerable_functions': vulnerableFunctions,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    package,
    vulnerableVersionRange,
    patchedVersions,
    listHash(vulnerableFunctions),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryUpdateVulnerabilitiesInner &&
        package == other.package &&
        vulnerableVersionRange == other.vulnerableVersionRange &&
        patchedVersions == other.patchedVersions &&
        listsEqual(vulnerableFunctions, other.vulnerableFunctions);
  }
}
