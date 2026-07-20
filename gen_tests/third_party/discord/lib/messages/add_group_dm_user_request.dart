import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AddGroupDmUserRequest {
  AddGroupDmUserRequest({this.accessToken, this.nick}) {
    accessToken?.validate(maxLength: 152133);
    nick?.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to an [AddGroupDmUserRequest].
  factory AddGroupDmUserRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AddGroupDmUserRequest',
      json,
      () => AddGroupDmUserRequest(
        accessToken: json['access_token'] as String?,
        nick: json['nick'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AddGroupDmUserRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AddGroupDmUserRequest.fromJson(json);
  }

  final String? accessToken;
  final String? nick;

  /// Converts an [AddGroupDmUserRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'nick': nick};
  }

  @override
  int get hashCode => Object.hashAll([accessToken, nick]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddGroupDmUserRequest &&
        accessToken == other.accessToken &&
        nick == other.nick;
  }
}
