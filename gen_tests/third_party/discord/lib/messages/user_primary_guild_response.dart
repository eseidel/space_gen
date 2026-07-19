import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserPrimaryGuildResponse {
  const UserPrimaryGuildResponse({
    required this.identityGuildId,
    required this.identityEnabled,
    required this.tag,
    required this.badge,
  });

  /// Converts a `Map<String, dynamic>` to a [UserPrimaryGuildResponse].
  factory UserPrimaryGuildResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserPrimaryGuildResponse',
      json,
      () => UserPrimaryGuildResponse(
        identityGuildId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'identity_guild_id') as String?,
        ),
        identityEnabled: checkedKey(json, 'identity_enabled') as bool?,
        tag: checkedKey(json, 'tag') as String?,
        badge: checkedKey(json, 'badge') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserPrimaryGuildResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserPrimaryGuildResponse.fromJson(json);
  }

  final SnowflakeType? identityGuildId;
  final bool? identityEnabled;
  final String? tag;
  final String? badge;

  /// Converts a [UserPrimaryGuildResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'identity_guild_id': identityGuildId?.toJson(),
      'identity_enabled': identityEnabled,
      'tag': tag,
      'badge': badge,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([identityGuildId, identityEnabled, tag, badge]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserPrimaryGuildResponse &&
        identityGuildId == other.identityGuildId &&
        identityEnabled == other.identityEnabled &&
        tag == other.tag &&
        badge == other.badge;
  }
}
