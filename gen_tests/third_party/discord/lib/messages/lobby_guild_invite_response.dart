import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class LobbyGuildInviteResponse {
  const LobbyGuildInviteResponse({required this.code});

  /// Converts a `Map<String, dynamic>` to a [LobbyGuildInviteResponse].
  factory LobbyGuildInviteResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LobbyGuildInviteResponse',
      json,
      () => LobbyGuildInviteResponse(code: json['code'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyGuildInviteResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LobbyGuildInviteResponse.fromJson(json);
  }

  final String code;

  /// Converts a [LobbyGuildInviteResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code};
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LobbyGuildInviteResponse && code == other.code;
  }
}
