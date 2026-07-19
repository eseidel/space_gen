import 'package:github/model_helpers.dart';
import 'package:github/models/security_advisory_ecosystems.dart';
import 'package:meta/meta.dart';

/// {@template repository_advisory_update_vulnerabilities_inner_package}
/// The name of the package affected by the vulnerability.
/// {@endtemplate}
@immutable
class RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage {
  /// {@macro repository_advisory_update_vulnerabilities_inner_package}
  const RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage({
    required this.ecosystem,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage].
  factory RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage',
      json,
      () => RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage(
        ecosystem: SecurityAdvisoryEcosystems.fromJson(
          json['ecosystem'] as String,
        ),
        name: json['name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.fromJson(json);
  }

  /// The package's language or package management ecosystem.
  final SecurityAdvisoryEcosystems ecosystem;

  /// The unique package name within its ecosystem.
  final String? name;

  /// Converts a [RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ecosystem': ecosystem.toJson(), 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([ecosystem, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage &&
        ecosystem == other.ecosystem &&
        name == other.name;
  }
}
