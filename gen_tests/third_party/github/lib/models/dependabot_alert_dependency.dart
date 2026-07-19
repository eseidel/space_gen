import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_alert_dependency_relationship.dart';
import 'package:github/models/dependabot_alert_dependency_scope.dart';
import 'package:github/models/dependabot_alert_package.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_dependency}
/// Details for the vulnerable dependency.
/// {@endtemplate}
@immutable
class DependabotAlertDependency {
  /// {@macro dependabot_alert_dependency}
  const DependabotAlertDependency({
    this.package,
    this.manifestPath,
    this.scope,
    this.relationship,
  });

  /// Converts a `Map<String, dynamic>` to a [DependabotAlertDependency].
  factory DependabotAlertDependency.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotAlertDependency',
      json,
      () => DependabotAlertDependency(
        package: DependabotAlertPackage.maybeFromJson(
          json['package'] as Map<String, dynamic>?,
        ),
        manifestPath: json['manifest_path'] as String?,
        scope: DependabotAlertDependencyScope.maybeFromJson(
          json['scope'] as String?,
        ),
        relationship: DependabotAlertDependencyRelationship.maybeFromJson(
          json['relationship'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertDependency? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertDependency.fromJson(json);
  }

  /// Details for the vulnerable package.
  final DependabotAlertPackage? package;

  /// The full path to the dependency manifest file, relative to the root of
  /// the repository.
  final String? manifestPath;

  /// The execution scope of the vulnerable dependency.
  final DependabotAlertDependencyScope? scope;

  /// The vulnerable dependency's relationship to your project.
  ///
  /// > [!NOTE]
  /// > We are rolling out support for dependency relationship across
  /// ecosystems. This value will be "unknown" for all dependencies in
  /// unsupported ecosystems.
  final DependabotAlertDependencyRelationship? relationship;

  /// Converts a [DependabotAlertDependency] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'package': package?.toJson(),
      'manifest_path': manifestPath,
      'scope': scope?.toJson(),
      'relationship': relationship?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([package, manifestPath, scope, relationship]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertDependency &&
        package == other.package &&
        manifestPath == other.manifestPath &&
        scope == other.scope &&
        relationship == other.relationship;
  }
}
