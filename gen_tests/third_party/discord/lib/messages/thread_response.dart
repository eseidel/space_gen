import 'package:discord/messages/thread_member_response.dart';
import 'package:discord/messages/thread_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/video_quality_modes.dart';
import 'package:meta/meta.dart';

@immutable
class ThreadResponse {
  const ThreadResponse({
    required this.id,
    required this.type,
    required this.flags,
    required this.guildId,
    required this.name,
    required this.ownerId,
    required this.threadMetadata,
    required this.messageCount,
    required this.memberCount,
    required this.totalMessageSent,
    this.lastMessageId,
    this.lastPinTimestamp,
    this.parentId,
    this.rateLimitPerUser,
    this.bitrate,
    this.userLimit,
    this.rtcRegion,
    this.videoQualityMode,
    this.permissions,
    this.appliedTags,
    this.member,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadResponse].
  factory ThreadResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadResponse',
      json,
      () => ThreadResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: ChannelTypes.fromJson(json['type'] as int),
        lastMessageId: SnowflakeType.maybeFromJson(
          json['last_message_id'] as String?,
        ),
        flags: json['flags'] as int,
        lastPinTimestamp: maybeParseDateTime(
          json['last_pin_timestamp'] as String?,
        ),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        name: json['name'] as String,
        parentId: SnowflakeType.maybeFromJson(json['parent_id'] as String?),
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
        bitrate: json['bitrate'] as int?,
        userLimit: json['user_limit'] as int?,
        rtcRegion: json['rtc_region'] as String?,
        videoQualityMode: VideoQualityModes.maybeFromJson(
          json['video_quality_mode'] as int?,
        ),
        permissions: json['permissions'] as String?,
        ownerId: SnowflakeType.fromJson(json['owner_id'] as String),
        threadMetadata: ThreadMetadataResponse.fromJson(
          json['thread_metadata'] as Map<String, dynamic>,
        ),
        messageCount: json['message_count'] as int,
        memberCount: json['member_count'] as int,
        totalMessageSent: json['total_message_sent'] as int,
        appliedTags: (json['applied_tags'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        member: ThreadMemberResponse.maybeFromJson(
          json['member'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadResponse.fromJson(json);
  }

  final SnowflakeType id;
  final ChannelTypes type;
  final SnowflakeType? lastMessageId;
  final int flags;
  final DateTime? lastPinTimestamp;
  final SnowflakeType guildId;
  final String name;
  final SnowflakeType? parentId;
  final int? rateLimitPerUser;
  final int? bitrate;
  final int? userLimit;
  final String? rtcRegion;
  final VideoQualityModes? videoQualityMode;
  final String? permissions;
  final SnowflakeType ownerId;
  final ThreadMetadataResponse threadMetadata;
  final int messageCount;
  final int memberCount;
  final int totalMessageSent;
  final List<SnowflakeType>? appliedTags;
  final ThreadMemberResponse? member;

  /// Converts a [ThreadResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'last_message_id': lastMessageId?.toJson(),
      'flags': flags,
      'last_pin_timestamp': lastPinTimestamp?.toIso8601String(),
      'guild_id': guildId.toJson(),
      'name': name,
      'parent_id': parentId?.toJson(),
      'rate_limit_per_user': ?rateLimitPerUser,
      'bitrate': ?bitrate,
      'user_limit': ?userLimit,
      'rtc_region': rtcRegion,
      'video_quality_mode': ?videoQualityMode?.toJson(),
      'permissions': ?permissions,
      'owner_id': ownerId.toJson(),
      'thread_metadata': threadMetadata.toJson(),
      'message_count': messageCount,
      'member_count': memberCount,
      'total_message_sent': totalMessageSent,
      'applied_tags': ?appliedTags?.map((e) => e.toJson()).toList(),
      'member': ?member?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    type,
    lastMessageId,
    flags,
    lastPinTimestamp,
    guildId,
    name,
    parentId,
    rateLimitPerUser,
    bitrate,
    userLimit,
    rtcRegion,
    videoQualityMode,
    permissions,
    ownerId,
    threadMetadata,
    messageCount,
    memberCount,
    totalMessageSent,
    listHash(appliedTags),
    member,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadResponse &&
        id == other.id &&
        type == other.type &&
        lastMessageId == other.lastMessageId &&
        flags == other.flags &&
        lastPinTimestamp == other.lastPinTimestamp &&
        guildId == other.guildId &&
        name == other.name &&
        parentId == other.parentId &&
        rateLimitPerUser == other.rateLimitPerUser &&
        bitrate == other.bitrate &&
        userLimit == other.userLimit &&
        rtcRegion == other.rtcRegion &&
        videoQualityMode == other.videoQualityMode &&
        permissions == other.permissions &&
        ownerId == other.ownerId &&
        threadMetadata == other.threadMetadata &&
        messageCount == other.messageCount &&
        memberCount == other.memberCount &&
        totalMessageSent == other.totalMessageSent &&
        listsEqual(appliedTags, other.appliedTags) &&
        member == other.member;
  }
}
