import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_permission_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandPermission {
  const ApplicationCommandPermission({
    required this.id,
    required this.type,
    required this.permission,
  });

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandPermission].
  factory ApplicationCommandPermission.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandPermission',
      json,
      () => ApplicationCommandPermission(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: ApplicationCommandPermissionType.fromJson(json['type'] as int),
        permission: json['permission'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandPermission? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandPermission.fromJson(json);
  }

  final SnowflakeType id;
  final ApplicationCommandPermissionType type;
  final bool permission;

  /// Converts an [ApplicationCommandPermission] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'type': type.toJson(), 'permission': permission};
  }

  @override
  int get hashCode => Object.hashAll([id, type, permission]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandPermission &&
        id == other.id &&
        type == other.type &&
        permission == other.permission;
  }
}
