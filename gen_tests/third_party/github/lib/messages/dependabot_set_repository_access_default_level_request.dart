// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_set_repository_access_default_level_request_default_level.dart';
import 'package:meta/meta.dart';

@immutable
class DependabotSetRepositoryAccessDefaultLevelRequest {
  const DependabotSetRepositoryAccessDefaultLevelRequest({
    required this.defaultLevel,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotSetRepositoryAccessDefaultLevelRequest].
  factory DependabotSetRepositoryAccessDefaultLevelRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotSetRepositoryAccessDefaultLevelRequest',
      json,
      () => DependabotSetRepositoryAccessDefaultLevelRequest(
        defaultLevel:
            DependabotSetRepositoryAccessDefaultLevelRequestDefaultLevel.fromJson(
              json['default_level'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotSetRepositoryAccessDefaultLevelRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotSetRepositoryAccessDefaultLevelRequest.fromJson(json);
  }

  /// The default repository access level for Dependabot updates.
  /// Example: `'internal'`
  final DependabotSetRepositoryAccessDefaultLevelRequestDefaultLevel
  defaultLevel;

  /// Converts a [DependabotSetRepositoryAccessDefaultLevelRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'default_level': defaultLevel.toJson()};
  }

  @override
  int get hashCode => defaultLevel.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotSetRepositoryAccessDefaultLevelRequest &&
        defaultLevel == other.defaultLevel;
  }
}
