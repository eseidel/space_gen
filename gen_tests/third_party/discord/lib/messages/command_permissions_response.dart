import 'package:discord/messages/command_permission_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class CommandPermissionsResponse {
  const CommandPermissionsResponse({
    required this.id,
    required this.applicationId,
    required this.guildId,
    required this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to a [CommandPermissionsResponse].
  factory CommandPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommandPermissionsResponse',
      json,
      () => CommandPermissionsResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        permissions: (json['permissions'] as List)
            .map<CommandPermissionResponse>(
              (e) =>
                  CommandPermissionResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommandPermissionsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommandPermissionsResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType applicationId;
  final SnowflakeType guildId;
  final List<CommandPermissionResponse> permissions;

  /// Converts a [CommandPermissionsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'application_id': applicationId.toJson(),
      'guild_id': guildId.toJson(),
      'permissions': permissions.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, applicationId, guildId, listHash(permissions)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommandPermissionsResponse &&
        id == other.id &&
        applicationId == other.applicationId &&
        guildId == other.guildId &&
        listsEqual(permissions, other.permissions);
  }
}
