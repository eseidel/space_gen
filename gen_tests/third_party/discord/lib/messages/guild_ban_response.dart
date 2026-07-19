import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildBanResponse {
  const GuildBanResponse({required this.user, required this.reason});

  /// Converts a `Map<String, dynamic>` to a [GuildBanResponse].
  factory GuildBanResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildBanResponse',
      json,
      () => GuildBanResponse(
        user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
        reason: checkedKey(json, 'reason') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildBanResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildBanResponse.fromJson(json);
  }

  final UserResponse user;
  final String? reason;

  /// Converts a [GuildBanResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'user': user.toJson(), 'reason': reason};
  }

  @override
  int get hashCode => Object.hashAll([user, reason]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildBanResponse &&
        user == other.user &&
        reason == other.reason;
  }
}
