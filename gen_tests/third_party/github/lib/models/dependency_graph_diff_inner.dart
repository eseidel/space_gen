import 'package:github/model_helpers.dart';
import 'package:github/models/dependency_graph_diff_inner_change_type.dart';
import 'package:github/models/dependency_graph_diff_inner_scope.dart';
import 'package:github/models/dependency_graph_diff_inner_vulnerabilities_inner.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphDiffInner {
  const DependencyGraphDiffInner({
    required this.changeType,
    required this.manifest,
    required this.ecosystem,
    required this.name,
    required this.version,
    required this.packageUrl,
    required this.license,
    required this.sourceRepositoryUrl,
    required this.vulnerabilities,
    required this.scope,
  });

  /// Converts a `Map<String, dynamic>` to a [DependencyGraphDiffInner].
  factory DependencyGraphDiffInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependencyGraphDiffInner',
      json,
      () => DependencyGraphDiffInner(
        changeType: DependencyGraphDiffInnerChangeType.fromJson(
          json['change_type'] as String,
        ),
        manifest: json['manifest'] as String,
        ecosystem: json['ecosystem'] as String,
        name: json['name'] as String,
        version: json['version'] as String,
        packageUrl: checkedKey(json, 'package_url') as String?,
        license: checkedKey(json, 'license') as String?,
        sourceRepositoryUrl:
            checkedKey(json, 'source_repository_url') as String?,
        vulnerabilities: (json['vulnerabilities'] as List)
            .map<DependencyGraphDiffInnerVulnerabilitiesInner>(
              (e) => DependencyGraphDiffInnerVulnerabilitiesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        scope: DependencyGraphDiffInnerScope.fromJson(json['scope'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphDiffInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependencyGraphDiffInner.fromJson(json);
  }

  final DependencyGraphDiffInnerChangeType changeType;

  /// Example: `'path/to/package-lock.json'`
  final String manifest;

  /// Example: `'npm'`
  final String ecosystem;

  /// Example: `'@actions/core'`
  final String name;

  /// Example: `'1.0.0'`
  final String version;

  /// Example: `'pkg:/npm/%40actions/core@1.1.0'`
  final String? packageUrl;

  /// Example: `'MIT'`
  final String? license;

  /// Example: `'https://github.com/github/actions'`
  final String? sourceRepositoryUrl;
  final List<DependencyGraphDiffInnerVulnerabilitiesInner> vulnerabilities;

  /// Where the dependency is utilized. `development` means that the
  /// dependency is only utilized in the development environment. `runtime`
  /// means that the dependency is utilized at runtime and in the development
  /// environment.
  final DependencyGraphDiffInnerScope scope;

  /// Converts a [DependencyGraphDiffInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'change_type': changeType.toJson(),
      'manifest': manifest,
      'ecosystem': ecosystem,
      'name': name,
      'version': version,
      'package_url': packageUrl,
      'license': license,
      'source_repository_url': sourceRepositoryUrl,
      'vulnerabilities': vulnerabilities.map((e) => e.toJson()).toList(),
      'scope': scope.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    changeType,
    manifest,
    ecosystem,
    name,
    version,
    packageUrl,
    license,
    sourceRepositoryUrl,
    listHash(vulnerabilities),
    scope,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphDiffInner &&
        changeType == other.changeType &&
        manifest == other.manifest &&
        ecosystem == other.ecosystem &&
        name == other.name &&
        version == other.version &&
        packageUrl == other.packageUrl &&
        license == other.license &&
        sourceRepositoryUrl == other.sourceRepositoryUrl &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        scope == other.scope;
  }
}
