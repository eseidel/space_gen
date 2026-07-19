import 'package:discord/model_helpers.dart';
import 'package:discord/models/create_or_join_lobby_request_flags_one_of_1.dart';
import 'package:meta/meta.dart';

@immutable
class CreateOrJoinLobbyRequest {
  const CreateOrJoinLobbyRequest({
    required this.secret,
    this.idleTimeoutSeconds,
    this.lobbyMetadata,
    this.memberMetadata,
    this.flags,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateOrJoinLobbyRequest].
  factory CreateOrJoinLobbyRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateOrJoinLobbyRequest',
      json,
      () => CreateOrJoinLobbyRequest(
        idleTimeoutSeconds: json['idle_timeout_seconds'] as int?,
        lobbyMetadata: (json['lobby_metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        memberMetadata: (json['member_metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        secret: json['secret'] as String,
        flags: CreateOrJoinLobbyRequestFlagsOneOf1.maybeFromJson(
          json['flags'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateOrJoinLobbyRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateOrJoinLobbyRequest.fromJson(json);
  }

  final int? idleTimeoutSeconds;
  final Map<String, String>? lobbyMetadata;
  final Map<String, String>? memberMetadata;
  final String secret;
  final CreateOrJoinLobbyRequestFlagsOneOf1? flags;

  /// Converts a [CreateOrJoinLobbyRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'idle_timeout_seconds': idleTimeoutSeconds,
      'lobby_metadata': lobbyMetadata,
      'member_metadata': memberMetadata,
      'secret': secret,
      'flags': flags?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    idleTimeoutSeconds,
    mapHash(lobbyMetadata),
    mapHash(memberMetadata),
    secret,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateOrJoinLobbyRequest &&
        idleTimeoutSeconds == other.idleTimeoutSeconds &&
        mapsEqual(lobbyMetadata, other.lobbyMetadata) &&
        mapsEqual(memberMetadata, other.memberMetadata) &&
        secret == other.secret &&
        flags == other.flags;
  }
}
