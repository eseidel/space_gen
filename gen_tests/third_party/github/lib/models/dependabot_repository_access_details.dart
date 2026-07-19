import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_repository_access_details_default_level.dart';
import 'package:github/models/simple_repository.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_repository_access_details}
/// Dependabot Repository Access Details
/// Information about repositories that Dependabot is able to access in an
/// organization
/// {@endtemplate}
@immutable
class DependabotRepositoryAccessDetails {
  /// {@macro dependabot_repository_access_details}
  const DependabotRepositoryAccessDetails({
    this.defaultLevel,
    this.accessibleRepositories,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotRepositoryAccessDetails].
  factory DependabotRepositoryAccessDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotRepositoryAccessDetails',
      json,
      () => DependabotRepositoryAccessDetails(
        defaultLevel:
            DependabotRepositoryAccessDetailsDefaultLevel.maybeFromJson(
              json['default_level'] as String?,
            ),
        accessibleRepositories: (json['accessible_repositories'] as List?)
            ?.map<SimpleRepository>(
              (e) => SimpleRepository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotRepositoryAccessDetails? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotRepositoryAccessDetails.fromJson(json);
  }

  /// The default repository access level for Dependabot updates.
  /// Example: `'internal'`
  final DependabotRepositoryAccessDetailsDefaultLevel? defaultLevel;
  final List<SimpleRepository>? accessibleRepositories;

  /// Converts a [DependabotRepositoryAccessDetails]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'default_level': defaultLevel?.toJson(),
      if (accessibleRepositories != null)
        'accessible_repositories': accessibleRepositories
            ?.map((e) => e.toJson())
            .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([defaultLevel, listHash(accessibleRepositories)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotRepositoryAccessDetails &&
        defaultLevel == other.defaultLevel &&
        listsEqual(accessibleRepositories, other.accessibleRepositories);
  }
}
