import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/add_lobby_member_request_flags_one_of_1.dart';
import 'package:meta/meta.dart';

@immutable
class AddLobbyMemberRequest {
  AddLobbyMemberRequest({this.metadata, this.flags}) {
    metadata?.validate(maxProperties: 25);
  }

  /// Converts a `Map<String, dynamic>` to an [AddLobbyMemberRequest].
  factory AddLobbyMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AddLobbyMemberRequest',
      json,
      () => AddLobbyMemberRequest(
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        flags: AddLobbyMemberRequestFlagsOneOf1.maybeFromJson(
          json['flags'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AddLobbyMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AddLobbyMemberRequest.fromJson(json);
  }

  final Map<String, String>? metadata;
  final AddLobbyMemberRequestFlagsOneOf1? flags;

  /// Converts an [AddLobbyMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'metadata': metadata, 'flags': flags?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([mapHash(metadata), flags]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddLobbyMemberRequest &&
        mapsEqual(metadata, other.metadata) &&
        flags == other.flags;
  }
}
