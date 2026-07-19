import 'package:discord/messages/guild_channel_response.dart';
import 'package:discord/messages/lobby_member_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/u_int32_type.dart';
import 'package:meta/meta.dart';

@immutable
class LobbyResponse {
  const LobbyResponse({
    required this.id,
    required this.applicationId,
    required this.metadata,
    required this.members,
    required this.flags,
    this.linkedChannel,
    this.overrideEventWebhooksUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [LobbyResponse].
  factory LobbyResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LobbyResponse',
      json,
      () => LobbyResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
        metadata: (checkedKey(json, 'metadata') as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        members: (json['members'] as List)
            .map<LobbyMemberResponse>(
              (e) => LobbyMemberResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        linkedChannel: GuildChannelResponse.maybeFromJson(
          json['linked_channel'] as Map<String, dynamic>?,
        ),
        flags: UInt32Type.fromJson(json['flags'] as int),
        overrideEventWebhooksUrl:
            json['override_event_webhooks_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LobbyResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType applicationId;
  final Map<String, String>? metadata;
  final List<LobbyMemberResponse> members;
  final GuildChannelResponse? linkedChannel;
  final UInt32Type flags;
  final String? overrideEventWebhooksUrl;

  /// Converts a [LobbyResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'application_id': applicationId.toJson(),
      'metadata': metadata,
      'members': members.map((e) => e.toJson()).toList(),
      'linked_channel': linkedChannel?.toJson(),
      'flags': flags.toJson(),
      'override_event_webhooks_url': overrideEventWebhooksUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    applicationId,
    mapHash(metadata),
    listHash(members),
    linkedChannel,
    flags,
    overrideEventWebhooksUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LobbyResponse &&
        id == other.id &&
        applicationId == other.applicationId &&
        mapsEqual(metadata, other.metadata) &&
        listsEqual(members, other.members) &&
        linkedChannel == other.linkedChannel &&
        flags == other.flags &&
        overrideEventWebhooksUrl == other.overrideEventWebhooksUrl;
  }
}
