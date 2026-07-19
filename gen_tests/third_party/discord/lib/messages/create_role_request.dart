import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/role_colors.dart';
import 'package:meta/meta.dart';

@immutable
class CreateRoleRequest {
  const CreateRoleRequest({
    this.name,
    this.permissions,
    this.color,
    this.colors,
    this.hoist,
    this.mentionable,
    this.icon,
    this.unicodeEmoji,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateRoleRequest].
  factory CreateRoleRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateRoleRequest',
      json,
      () => CreateRoleRequest(
        name: json['name'] as String?,
        permissions: json['permissions'] as int?,
        color: json['color'] as int?,
        colors: RoleColors.maybeFromJson(
          json['colors'] as Map<String, dynamic>?,
        ),
        hoist: json['hoist'] as bool?,
        mentionable: json['mentionable'] as bool?,
        icon: maybeBase64Decode(json['icon'] as String?),
        unicodeEmoji: json['unicode_emoji'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateRoleRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateRoleRequest.fromJson(json);
  }

  final String? name;
  final int? permissions;
  final int? color;
  final RoleColors? colors;
  final bool? hoist;
  final bool? mentionable;
  final Uint8List? icon;
  final String? unicodeEmoji;

  /// Converts a [CreateRoleRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'permissions': permissions,
      'color': color,
      'colors': colors?.toJson(),
      'hoist': hoist,
      'mentionable': mentionable,
      'icon': maybeBase64Encode(icon),
      'unicode_emoji': unicodeEmoji,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    permissions,
    color,
    colors,
    hoist,
    mentionable,
    listHash(icon),
    unicodeEmoji,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateRoleRequest &&
        name == other.name &&
        permissions == other.permissions &&
        color == other.color &&
        colors == other.colors &&
        hoist == other.hoist &&
        mentionable == other.mentionable &&
        listsEqual(icon, other.icon) &&
        unicodeEmoji == other.unicodeEmoji;
  }
}
