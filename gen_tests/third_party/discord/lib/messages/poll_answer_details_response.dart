import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollAnswerDetailsResponse {
  const PollAnswerDetailsResponse({required this.users});

  /// Converts a `Map<String, dynamic>` to a [PollAnswerDetailsResponse].
  factory PollAnswerDetailsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollAnswerDetailsResponse',
      json,
      () => PollAnswerDetailsResponse(
        users: (json['users'] as List)
            .map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollAnswerDetailsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollAnswerDetailsResponse.fromJson(json);
  }

  final List<UserResponse> users;

  /// Converts a [PollAnswerDetailsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'users': users.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(users).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollAnswerDetailsResponse && listsEqual(users, other.users);
  }
}
