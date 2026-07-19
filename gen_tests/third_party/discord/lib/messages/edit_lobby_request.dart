import 'package:discord/messages/lobby_member_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/edit_lobby_request_flags_one_of_1.dart';
import 'package:meta/meta.dart';

@immutable
class EditLobbyRequest {
  const EditLobbyRequest({
    this.idleTimeoutSeconds,
    this.metadata,
    this.members,
    this.flags,
    this.overrideEventWebhooksUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [EditLobbyRequest].
  factory EditLobbyRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EditLobbyRequest',
      json,
      () => EditLobbyRequest(
        idleTimeoutSeconds: json['idle_timeout_seconds'] as int?,
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        members: (json['members'] as List?)
            ?.map<LobbyMemberRequest>(
              (e) => LobbyMemberRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        flags: EditLobbyRequestFlagsOneOf1.maybeFromJson(json['flags'] as int?),
        overrideEventWebhooksUrl: maybeParseUri(
          json['override_event_webhooks_url'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EditLobbyRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EditLobbyRequest.fromJson(json);
  }

  final int? idleTimeoutSeconds;
  final Map<String, String>? metadata;
  final List<LobbyMemberRequest>? members;
  final EditLobbyRequestFlagsOneOf1? flags;
  final Uri? overrideEventWebhooksUrl;

  /// Converts an [EditLobbyRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'idle_timeout_seconds': idleTimeoutSeconds,
      'metadata': metadata,
      'members': members?.map((e) => e.toJson()).toList(),
      'flags': flags?.toJson(),
      'override_event_webhooks_url': overrideEventWebhooksUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    idleTimeoutSeconds,
    mapHash(metadata),
    listHash(members),
    flags,
    overrideEventWebhooksUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EditLobbyRequest &&
        idleTimeoutSeconds == other.idleTimeoutSeconds &&
        mapsEqual(metadata, other.metadata) &&
        listsEqual(members, other.members) &&
        flags == other.flags &&
        overrideEventWebhooksUrl == other.overrideEventWebhooksUrl;
  }
}
