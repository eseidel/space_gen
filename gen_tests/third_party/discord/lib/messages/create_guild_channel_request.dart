import 'package:discord/messages/channel_permission_overwrite_request.dart';
import 'package:discord/messages/create_or_update_thread_tag_request.dart';
import 'package:discord/messages/update_default_reaction_emoji_request.dart';
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
class CreateGuildChannelRequest {
  const CreateGuildChannelRequest({
    required this.name,
    this.type,
    this.position,
    this.topic,
    this.bitrate,
    this.userLimit,
    this.nsfw,
    this.rateLimitPerUser,
    this.parentId,
    this.permissionOverwrites,
    this.rtcRegion,
    this.videoQualityMode,
    this.defaultAutoArchiveDuration,
    this.defaultReactionEmoji,
    this.defaultThreadRateLimitPerUser,
    this.defaultSortOrder,
    this.defaultForumLayout,
    this.defaultTagSetting,
    this.availableTags,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateGuildChannelRequest].
  factory CreateGuildChannelRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGuildChannelRequest',
      json,
      () => CreateGuildChannelRequest(
        type: ChannelTypes.maybeFromJson(json['type'] as int?),
        name: json['name'] as String,
        position: json['position'] as int?,
        topic: json['topic'] as String?,
        bitrate: json['bitrate'] as int?,
        userLimit: json['user_limit'] as int?,
        nsfw: json['nsfw'] as bool?,
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
        parentId: SnowflakeType.maybeFromJson(json['parent_id'] as String?),
        permissionOverwrites: (json['permission_overwrites'] as List?)
            ?.map<ChannelPermissionOverwriteRequest>(
              (e) => ChannelPermissionOverwriteRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        rtcRegion: json['rtc_region'] as String?,
        videoQualityMode: VideoQualityModes.maybeFromJson(
          json['video_quality_mode'] as int?,
        ),
        defaultAutoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['default_auto_archive_duration'] as int?,
        ),
        defaultReactionEmoji: UpdateDefaultReactionEmojiRequest.maybeFromJson(
          json['default_reaction_emoji'] as Map<String, dynamic>?,
        ),
        defaultThreadRateLimitPerUser:
            json['default_thread_rate_limit_per_user'] as int?,
        defaultSortOrder: ThreadSortOrder.maybeFromJson(
          json['default_sort_order'] as int?,
        ),
        defaultForumLayout: ForumLayout.maybeFromJson(
          json['default_forum_layout'] as int?,
        ),
        defaultTagSetting: ThreadSearchTagSetting.maybeFromJson(
          json['default_tag_setting'] as String?,
        ),
        availableTags: (json['available_tags'] as List?)
            ?.map<CreateOrUpdateThreadTagRequest>(
              (e) => CreateOrUpdateThreadTagRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildChannelRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildChannelRequest.fromJson(json);
  }

  final ChannelTypes? type;
  final String name;
  final int? position;
  final String? topic;
  final int? bitrate;
  final int? userLimit;
  final bool? nsfw;
  final int? rateLimitPerUser;
  final SnowflakeType? parentId;
  final List<ChannelPermissionOverwriteRequest>? permissionOverwrites;
  final String? rtcRegion;
  final VideoQualityModes? videoQualityMode;
  final ThreadAutoArchiveDuration? defaultAutoArchiveDuration;
  final UpdateDefaultReactionEmojiRequest? defaultReactionEmoji;
  final int? defaultThreadRateLimitPerUser;
  final ThreadSortOrder? defaultSortOrder;
  final ForumLayout? defaultForumLayout;
  final ThreadSearchTagSetting? defaultTagSetting;
  final List<CreateOrUpdateThreadTagRequest>? availableTags;

  /// Converts a [CreateGuildChannelRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type?.toJson(),
      'name': name,
      'position': position,
      'topic': topic,
      'bitrate': bitrate,
      'user_limit': userLimit,
      'nsfw': nsfw,
      'rate_limit_per_user': rateLimitPerUser,
      'parent_id': parentId?.toJson(),
      'permission_overwrites': permissionOverwrites
          ?.map((e) => e.toJson())
          .toList(),
      'rtc_region': rtcRegion,
      'video_quality_mode': videoQualityMode?.toJson(),
      'default_auto_archive_duration': defaultAutoArchiveDuration?.toJson(),
      'default_reaction_emoji': defaultReactionEmoji?.toJson(),
      'default_thread_rate_limit_per_user': defaultThreadRateLimitPerUser,
      'default_sort_order': defaultSortOrder?.toJson(),
      'default_forum_layout': defaultForumLayout?.toJson(),
      'default_tag_setting': defaultTagSetting?.toJson(),
      'available_tags': availableTags?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    name,
    position,
    topic,
    bitrate,
    userLimit,
    nsfw,
    rateLimitPerUser,
    parentId,
    listHash(permissionOverwrites),
    rtcRegion,
    videoQualityMode,
    defaultAutoArchiveDuration,
    defaultReactionEmoji,
    defaultThreadRateLimitPerUser,
    defaultSortOrder,
    defaultForumLayout,
    defaultTagSetting,
    listHash(availableTags),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildChannelRequest &&
        type == other.type &&
        name == other.name &&
        position == other.position &&
        topic == other.topic &&
        bitrate == other.bitrate &&
        userLimit == other.userLimit &&
        nsfw == other.nsfw &&
        rateLimitPerUser == other.rateLimitPerUser &&
        parentId == other.parentId &&
        listsEqual(permissionOverwrites, other.permissionOverwrites) &&
        rtcRegion == other.rtcRegion &&
        videoQualityMode == other.videoQualityMode &&
        defaultAutoArchiveDuration == other.defaultAutoArchiveDuration &&
        defaultReactionEmoji == other.defaultReactionEmoji &&
        defaultThreadRateLimitPerUser == other.defaultThreadRateLimitPerUser &&
        defaultSortOrder == other.defaultSortOrder &&
        defaultForumLayout == other.defaultForumLayout &&
        defaultTagSetting == other.defaultTagSetting &&
        listsEqual(availableTags, other.availableTags);
  }
}
