import 'package:discord/messages/user_nameplate_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UserCollectiblesResponse {
  const UserCollectiblesResponse({required this.nameplate});

  /// Converts a `Map<String, dynamic>` to a [UserCollectiblesResponse].
  factory UserCollectiblesResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserCollectiblesResponse',
      json,
      () => UserCollectiblesResponse(
        nameplate: UserNameplateResponse.maybeFromJson(
          checkedKey(json, 'nameplate') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCollectiblesResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserCollectiblesResponse.fromJson(json);
  }

  final UserNameplateResponse? nameplate;

  /// Converts a [UserCollectiblesResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'nameplate': nameplate?.toJson()};
  }

  @override
  int get hashCode => nameplate.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCollectiblesResponse && nameplate == other.nameplate;
  }
}
