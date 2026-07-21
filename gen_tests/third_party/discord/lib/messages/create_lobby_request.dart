import 'package:discord/api_exception.dart';
import 'package:discord/messages/lobby_member_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/create_lobby_request_flags_one_of_1.dart';
import 'package:meta/meta.dart';

@immutable
class CreateLobbyRequest {
  CreateLobbyRequest({
    this.idleTimeoutSeconds,
    this.members,
    this.metadata,
    this.flags,
    this.overrideEventWebhooksUrl,
  }) {
    idleTimeoutSeconds?.validate(min: 5, max: 604800);
    members?.validate(maxItems: 25);
    metadata?.validate(maxProperties: 25);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateLobbyRequest].
  factory CreateLobbyRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateLobbyRequest',
      json,
      () => CreateLobbyRequest(
        idleTimeoutSeconds: json['idle_timeout_seconds'] as int?,
        members: (json['members'] as List?)
            ?.map<LobbyMemberRequest>(
              (e) => LobbyMemberRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        flags: CreateLobbyRequestFlagsOneOf1.maybeFromJson(
          json['flags'] as int?,
        ),
        overrideEventWebhooksUrl: maybeParseUri(
          json['override_event_webhooks_url'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateLobbyRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateLobbyRequest.fromJson(json);
  }

  final int? idleTimeoutSeconds;
  final List<LobbyMemberRequest>? members;
  final Map<String, String>? metadata;
  final CreateLobbyRequestFlagsOneOf1? flags;
  final Uri? overrideEventWebhooksUrl;

  /// Converts a [CreateLobbyRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'idle_timeout_seconds': idleTimeoutSeconds,
      'members': members?.map((e) => e.toJson()).toList(),
      'metadata': metadata,
      'flags': flags?.toJson(),
      'override_event_webhooks_url': overrideEventWebhooksUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    idleTimeoutSeconds,
    listHash(members),
    mapHash(metadata),
    flags,
    overrideEventWebhooksUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateLobbyRequest &&
        idleTimeoutSeconds == other.idleTimeoutSeconds &&
        listsEqual(members, other.members) &&
        mapsEqual(metadata, other.metadata) &&
        flags == other.flags &&
        overrideEventWebhooksUrl == other.overrideEventWebhooksUrl;
  }
}
