import 'package:discord/messages/guild_role_colors_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class InviteGuildRoleResponse {
  const InviteGuildRoleResponse({
    required this.id,
    required this.name,
    required this.position,
    required this.color,
    required this.colors,
    required this.icon,
    required this.unicodeEmoji,
    this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to an [InviteGuildRoleResponse].
  factory InviteGuildRoleResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InviteGuildRoleResponse',
      json,
      () => InviteGuildRoleResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        position: json['position'] as int,
        color: json['color'] as int,
        colors: GuildRoleColorsResponse.fromJson(
          json['colors'] as Map<String, dynamic>,
        ),
        icon: checkedKey(json, 'icon') as String?,
        unicodeEmoji: checkedKey(json, 'unicode_emoji') as String?,
        permissions: json['permissions'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InviteGuildRoleResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InviteGuildRoleResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final int position;
  final int color;
  final GuildRoleColorsResponse colors;
  final String? icon;
  final String? unicodeEmoji;
  final String? permissions;

  /// Converts an [InviteGuildRoleResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'position': position,
      'color': color,
      'colors': colors.toJson(),
      'icon': icon,
      'unicode_emoji': unicodeEmoji,
      'permissions': ?permissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    position,
    color,
    colors,
    icon,
    unicodeEmoji,
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InviteGuildRoleResponse &&
        id == other.id &&
        name == other.name &&
        position == other.position &&
        color == other.color &&
        colors == other.colors &&
        icon == other.icon &&
        unicodeEmoji == other.unicodeEmoji &&
        permissions == other.permissions;
  }
}
