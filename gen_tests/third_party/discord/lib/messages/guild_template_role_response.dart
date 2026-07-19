import 'package:discord/messages/guild_template_role_colors_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateRoleResponse {
  const GuildTemplateRoleResponse({
    required this.id,
    required this.name,
    required this.permissions,
    required this.color,
    required this.colors,
    required this.hoist,
    required this.mentionable,
    required this.icon,
    required this.unicodeEmoji,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateRoleResponse].
  factory GuildTemplateRoleResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateRoleResponse',
      json,
      () => GuildTemplateRoleResponse(
        id: json['id'] as int,
        name: json['name'] as String,
        permissions: json['permissions'] as String,
        color: json['color'] as int,
        colors: GuildTemplateRoleColorsResponse.maybeFromJson(
          checkedKey(json, 'colors') as Map<String, dynamic>?,
        ),
        hoist: json['hoist'] as bool,
        mentionable: json['mentionable'] as bool,
        icon: checkedKey(json, 'icon') as String?,
        unicodeEmoji: checkedKey(json, 'unicode_emoji') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateRoleResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildTemplateRoleResponse.fromJson(json);
  }

  final int id;
  final String name;
  final String permissions;
  final int color;
  final GuildTemplateRoleColorsResponse? colors;
  final bool hoist;
  final bool mentionable;
  final String? icon;
  final String? unicodeEmoji;

  /// Converts a [GuildTemplateRoleResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'permissions': permissions,
      'color': color,
      'colors': colors?.toJson(),
      'hoist': hoist,
      'mentionable': mentionable,
      'icon': icon,
      'unicode_emoji': unicodeEmoji,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    permissions,
    color,
    colors,
    hoist,
    mentionable,
    icon,
    unicodeEmoji,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateRoleResponse &&
        id == other.id &&
        name == other.name &&
        permissions == other.permissions &&
        color == other.color &&
        colors == other.colors &&
        hoist == other.hoist &&
        mentionable == other.mentionable &&
        icon == other.icon &&
        unicodeEmoji == other.unicodeEmoji;
  }
}
