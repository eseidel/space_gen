import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_alert_package.dart';
import 'package:github/models/dependabot_alert_with_repository_dependency_relationship.dart';
import 'package:github/models/dependabot_alert_with_repository_dependency_scope.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_with_repository_dependency}
/// Details for the vulnerable dependency.
/// {@endtemplate}
@immutable
class DependabotAlertWithRepositoryDependency {
  /// {@macro dependabot_alert_with_repository_dependency}
  const DependabotAlertWithRepositoryDependency({
    this.package,
    this.manifestPath,
    this.scope,
    this.relationship,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotAlertWithRepositoryDependency].
  factory DependabotAlertWithRepositoryDependency.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotAlertWithRepositoryDependency',
      json,
      () => DependabotAlertWithRepositoryDependency(
        package: DependabotAlertPackage.maybeFromJson(
          json['package'] as Map<String, dynamic>?,
        ),
        manifestPath: json['manifest_path'] as String?,
        scope: DependabotAlertWithRepositoryDependencyScope.maybeFromJson(
          json['scope'] as String?,
        ),
        relationship:
            DependabotAlertWithRepositoryDependencyRelationship.maybeFromJson(
              json['relationship'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertWithRepositoryDependency? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertWithRepositoryDependency.fromJson(json);
  }

  /// Details for the vulnerable package.
  final DependabotAlertPackage? package;

  /// The full path to the dependency manifest file, relative to the root of
  /// the repository.
  final String? manifestPath;

  /// The execution scope of the vulnerable dependency.
  final DependabotAlertWithRepositoryDependencyScope? scope;

  /// The vulnerable dependency's relationship to your project.
  ///
  /// > [!NOTE]
  /// > We are rolling out support for dependency relationship across
  /// ecosystems. This value will be "unknown" for all dependencies in
  /// unsupported ecosystems.
  final DependabotAlertWithRepositoryDependencyRelationship? relationship;

  /// Converts a [DependabotAlertWithRepositoryDependency]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (package != null) 'package': package?.toJson(),
      if (manifestPath != null) 'manifest_path': manifestPath,
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
    return other is DependabotAlertWithRepositoryDependency &&
        package == other.package &&
        manifestPath == other.manifestPath &&
        scope == other.scope &&
        relationship == other.relationship;
  }
}
