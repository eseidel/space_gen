import 'package:discord/messages/channel_permission_overwrite_response.dart';
import 'package:discord/messages/default_reaction_emoji_response.dart';
import 'package:discord/messages/icon_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/forum_layout.dart';
import 'package:discord/models/guild_template_channel_tags.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:discord/models/thread_search_tag_setting.dart';
import 'package:discord/models/thread_sort_order.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateChannelResponse {
  const GuildTemplateChannelResponse({
    required this.id,
    required this.type,
    required this.name,
    required this.position,
    required this.topic,
    required this.bitrate,
    required this.userLimit,
    required this.nsfw,
    required this.rateLimitPerUser,
    required this.parentId,
    required this.defaultAutoArchiveDuration,
    required this.permissionOverwrites,
    required this.availableTags,
    required this.template,
    required this.defaultReactionEmoji,
    required this.defaultThreadRateLimitPerUser,
    required this.defaultSortOrder,
    required this.defaultForumLayout,
    required this.defaultTagSetting,
    required this.iconEmoji,
    required this.themeColor,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateChannelResponse].
  factory GuildTemplateChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateChannelResponse',
      json,
      () => GuildTemplateChannelResponse(
        id: checkedKey(json, 'id') as int?,
        type: ChannelTypes.fromJson(json['type'] as int),
        name: checkedKey(json, 'name') as String?,
        position: checkedKey(json, 'position') as int?,
        topic: checkedKey(json, 'topic') as String?,
        bitrate: json['bitrate'] as int,
        userLimit: json['user_limit'] as int,
        nsfw: json['nsfw'] as bool,
        rateLimitPerUser: json['rate_limit_per_user'] as int,
        parentId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'parent_id') as String?,
        ),
        defaultAutoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          checkedKey(json, 'default_auto_archive_duration') as int?,
        ),
        permissionOverwrites: (json['permission_overwrites'] as List)
            .map<ChannelPermissionOverwriteResponse>(
              (e) => ChannelPermissionOverwriteResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        availableTags: (checkedKey(json, 'available_tags') as List?)
            ?.map<GuildTemplateChannelTags>(
              (e) =>
                  GuildTemplateChannelTags.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        template: json['template'] as String,
        defaultReactionEmoji: DefaultReactionEmojiResponse.maybeFromJson(
          checkedKey(json, 'default_reaction_emoji') as Map<String, dynamic>?,
        ),
        defaultThreadRateLimitPerUser:
            checkedKey(json, 'default_thread_rate_limit_per_user') as int?,
        defaultSortOrder: ThreadSortOrder.maybeFromJson(
          checkedKey(json, 'default_sort_order') as int?,
        ),
        defaultForumLayout: ForumLayout.maybeFromJson(
          checkedKey(json, 'default_forum_layout') as int?,
        ),
        defaultTagSetting: ThreadSearchTagSetting.maybeFromJson(
          checkedKey(json, 'default_tag_setting') as String?,
        ),
        iconEmoji: IconEmojiResponse.maybeFromJson(
          checkedKey(json, 'icon_emoji') as Map<String, dynamic>?,
        ),
        themeColor: checkedKey(json, 'theme_color') as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateChannelResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildTemplateChannelResponse.fromJson(json);
  }

  final int? id;
  final ChannelTypes type;
  final String? name;
  final int? position;
  final String? topic;
  final int bitrate;
  final int userLimit;
  final bool nsfw;
  final int rateLimitPerUser;
  final SnowflakeType? parentId;
  final ThreadAutoArchiveDuration? defaultAutoArchiveDuration;
  final List<ChannelPermissionOverwriteResponse> permissionOverwrites;
  final List<GuildTemplateChannelTags>? availableTags;
  final String template;
  final DefaultReactionEmojiResponse? defaultReactionEmoji;
  final int? defaultThreadRateLimitPerUser;
  final ThreadSortOrder? defaultSortOrder;
  final ForumLayout? defaultForumLayout;
  final ThreadSearchTagSetting? defaultTagSetting;
  final IconEmojiResponse? iconEmoji;
  final int? themeColor;

  /// Converts a [GuildTemplateChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toJson(),
      'name': name,
      'position': position,
      'topic': topic,
      'bitrate': bitrate,
      'user_limit': userLimit,
      'nsfw': nsfw,
      'rate_limit_per_user': rateLimitPerUser,
      'parent_id': parentId?.toJson(),
      'default_auto_archive_duration': defaultAutoArchiveDuration?.toJson(),
      'permission_overwrites': permissionOverwrites
          .map((e) => e.toJson())
          .toList(),
      'available_tags': availableTags?.map((e) => e.toJson()).toList(),
      'template': template,
      'default_reaction_emoji': defaultReactionEmoji?.toJson(),
      'default_thread_rate_limit_per_user': defaultThreadRateLimitPerUser,
      'default_sort_order': defaultSortOrder?.toJson(),
      'default_forum_layout': defaultForumLayout?.toJson(),
      'default_tag_setting': defaultTagSetting?.toJson(),
      'icon_emoji': iconEmoji?.toJson(),
      'theme_color': themeColor,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    type,
    name,
    position,
    topic,
    bitrate,
    userLimit,
    nsfw,
    rateLimitPerUser,
    parentId,
    defaultAutoArchiveDuration,
    listHash(permissionOverwrites),
    listHash(availableTags),
    template,
    defaultReactionEmoji,
    defaultThreadRateLimitPerUser,
    defaultSortOrder,
    defaultForumLayout,
    defaultTagSetting,
    iconEmoji,
    themeColor,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateChannelResponse &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        position == other.position &&
        topic == other.topic &&
        bitrate == other.bitrate &&
        userLimit == other.userLimit &&
        nsfw == other.nsfw &&
        rateLimitPerUser == other.rateLimitPerUser &&
        parentId == other.parentId &&
        defaultAutoArchiveDuration == other.defaultAutoArchiveDuration &&
        listsEqual(permissionOverwrites, other.permissionOverwrites) &&
        listsEqual(availableTags, other.availableTags) &&
        template == other.template &&
        defaultReactionEmoji == other.defaultReactionEmoji &&
        defaultThreadRateLimitPerUser == other.defaultThreadRateLimitPerUser &&
        defaultSortOrder == other.defaultSortOrder &&
        defaultForumLayout == other.defaultForumLayout &&
        defaultTagSetting == other.defaultTagSetting &&
        iconEmoji == other.iconEmoji &&
        themeColor == other.themeColor;
  }
}
