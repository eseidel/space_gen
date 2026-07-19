import 'package:discord/messages/channel_permission_overwrite_response.dart';
import 'package:discord/messages/default_reaction_emoji_response.dart';
import 'package:discord/messages/forum_tag_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/forum_layout.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:discord/models/thread_search_tag_setting.dart';
import 'package:discord/models/thread_sort_order.dart';
import 'package:discord/models/video_quality_modes.dart';
import 'package:meta/meta.dart';

@immutable
class GuildChannelResponse {
  const GuildChannelResponse({
    required this.id,
    required this.type,
    required this.flags,
    required this.guildId,
    required this.name,
    required this.position,
    this.lastMessageId,
    this.lastPinTimestamp,
    this.parentId,
    this.rateLimitPerUser,
    this.bitrate,
    this.userLimit,
    this.rtcRegion,
    this.videoQualityMode,
    this.permissions,
    this.topic,
    this.defaultAutoArchiveDuration,
    this.defaultThreadRateLimitPerUser,
    this.permissionOverwrites,
    this.nsfw,
    this.availableTags,
    this.defaultReactionEmoji,
    this.defaultSortOrder,
    this.defaultForumLayout,
    this.defaultTagSetting,
    this.hdStreamingUntil,
    this.hdStreamingBuyerId,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildChannelResponse].
  factory GuildChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildChannelResponse',
      json,
      () => GuildChannelResponse(
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
        topic: json['topic'] as String?,
        defaultAutoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['default_auto_archive_duration'] as int?,
        ),
        defaultThreadRateLimitPerUser:
            json['default_thread_rate_limit_per_user'] as int?,
        position: json['position'] as int,
        permissionOverwrites: (json['permission_overwrites'] as List?)
            ?.map<ChannelPermissionOverwriteResponse>(
              (e) => ChannelPermissionOverwriteResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        nsfw: json['nsfw'] as bool?,
        availableTags: (json['available_tags'] as List?)
            ?.map<ForumTagResponse>(
              (e) => ForumTagResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        defaultReactionEmoji: DefaultReactionEmojiResponse.maybeFromJson(
          json['default_reaction_emoji'] as Map<String, dynamic>?,
        ),
        defaultSortOrder: ThreadSortOrder.maybeFromJson(
          json['default_sort_order'] as int?,
        ),
        defaultForumLayout: ForumLayout.maybeFromJson(
          json['default_forum_layout'] as int?,
        ),
        defaultTagSetting: ThreadSearchTagSetting.maybeFromJson(
          json['default_tag_setting'] as String?,
        ),
        hdStreamingUntil: maybeParseDateTime(
          json['hd_streaming_until'] as String?,
        ),
        hdStreamingBuyerId: SnowflakeType.maybeFromJson(
          json['hd_streaming_buyer_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildChannelResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildChannelResponse.fromJson(json);
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
  final String? topic;
  final ThreadAutoArchiveDuration? defaultAutoArchiveDuration;
  final int? defaultThreadRateLimitPerUser;
  final int position;
  final List<ChannelPermissionOverwriteResponse>? permissionOverwrites;
  final bool? nsfw;
  final List<ForumTagResponse>? availableTags;
  final DefaultReactionEmojiResponse? defaultReactionEmoji;
  final ThreadSortOrder? defaultSortOrder;
  final ForumLayout? defaultForumLayout;
  final ThreadSearchTagSetting? defaultTagSetting;
  final DateTime? hdStreamingUntil;
  final SnowflakeType? hdStreamingBuyerId;

  /// Converts a [GuildChannelResponse] to a `Map<String, dynamic>`.
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
      'topic': topic,
      'default_auto_archive_duration': ?defaultAutoArchiveDuration?.toJson(),
      'default_thread_rate_limit_per_user': ?defaultThreadRateLimitPerUser,
      'position': position,
      'permission_overwrites': ?permissionOverwrites
          ?.map((e) => e.toJson())
          .toList(),
      'nsfw': ?nsfw,
      'available_tags': ?availableTags?.map((e) => e.toJson()).toList(),
      'default_reaction_emoji': defaultReactionEmoji?.toJson(),
      'default_sort_order': defaultSortOrder?.toJson(),
      'default_forum_layout': ?defaultForumLayout?.toJson(),
      'default_tag_setting': defaultTagSetting?.toJson(),
      'hd_streaming_until': ?hdStreamingUntil?.toIso8601String(),
      'hd_streaming_buyer_id': ?hdStreamingBuyerId?.toJson(),
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
    topic,
    defaultAutoArchiveDuration,
    defaultThreadRateLimitPerUser,
    position,
    listHash(permissionOverwrites),
    nsfw,
    listHash(availableTags),
    defaultReactionEmoji,
    defaultSortOrder,
    defaultForumLayout,
    defaultTagSetting,
    hdStreamingUntil,
    hdStreamingBuyerId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildChannelResponse &&
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
        topic == other.topic &&
        defaultAutoArchiveDuration == other.defaultAutoArchiveDuration &&
        defaultThreadRateLimitPerUser == other.defaultThreadRateLimitPerUser &&
        position == other.position &&
        listsEqual(permissionOverwrites, other.permissionOverwrites) &&
        nsfw == other.nsfw &&
        listsEqual(availableTags, other.availableTags) &&
        defaultReactionEmoji == other.defaultReactionEmoji &&
        defaultSortOrder == other.defaultSortOrder &&
        defaultForumLayout == other.defaultForumLayout &&
        defaultTagSetting == other.defaultTagSetting &&
        hdStreamingUntil == other.hdStreamingUntil &&
        hdStreamingBuyerId == other.hdStreamingBuyerId;
  }
}
