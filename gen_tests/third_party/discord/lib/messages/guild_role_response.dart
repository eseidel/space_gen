import 'package:discord/messages/guild_role_colors_response.dart';
import 'package:discord/messages/guild_role_tags_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildRoleResponse {
  const GuildRoleResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.permissions,
    required this.position,
    required this.color,
    required this.colors,
    required this.hoist,
    required this.managed,
    required this.mentionable,
    required this.icon,
    required this.unicodeEmoji,
    required this.flags,
    this.tags,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildRoleResponse].
  factory GuildRoleResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildRoleResponse',
      json,
      () => GuildRoleResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        permissions: json['permissions'] as String,
        position: json['position'] as int,
        color: json['color'] as int,
        colors: GuildRoleColorsResponse.fromJson(
          json['colors'] as Map<String, dynamic>,
        ),
        hoist: json['hoist'] as bool,
        managed: json['managed'] as bool,
        mentionable: json['mentionable'] as bool,
        icon: checkedKey(json, 'icon') as String?,
        unicodeEmoji: checkedKey(json, 'unicode_emoji') as String?,
        tags: GuildRoleTagsResponse.maybeFromJson(
          json['tags'] as Map<String, dynamic>?,
        ),
        flags: json['flags'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildRoleResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildRoleResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? description;
  final String permissions;
  final int position;
  final int color;
  final GuildRoleColorsResponse colors;
  final bool hoist;
  final bool managed;
  final bool mentionable;
  final String? icon;
  final String? unicodeEmoji;
  final GuildRoleTagsResponse? tags;
  final int flags;

  /// Converts a [GuildRoleResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'description': description,
      'permissions': permissions,
      'position': position,
      'color': color,
      'colors': colors.toJson(),
      'hoist': hoist,
      'managed': managed,
      'mentionable': mentionable,
      'icon': icon,
      'unicode_emoji': unicodeEmoji,
      'tags': ?tags?.toJson(),
      'flags': flags,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    description,
    permissions,
    position,
    color,
    colors,
    hoist,
    managed,
    mentionable,
    icon,
    unicodeEmoji,
    tags,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildRoleResponse &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        permissions == other.permissions &&
        position == other.position &&
        color == other.color &&
        colors == other.colors &&
        hoist == other.hoist &&
        managed == other.managed &&
        mentionable == other.mentionable &&
        icon == other.icon &&
        unicodeEmoji == other.unicodeEmoji &&
        tags == other.tags &&
        flags == other.flags;
  }
}
