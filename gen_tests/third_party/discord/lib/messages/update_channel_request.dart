import 'dart:typed_data';
import 'package:discord/messages/channel_permission_overwrite_request.dart';
import 'package:discord/messages/update_default_reaction_emoji_request.dart';
import 'package:discord/messages/update_thread_tag_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/forum_layout.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:discord/models/thread_search_tag_setting.dart';
import 'package:discord/models/thread_sort_order.dart';
import 'package:discord/models/video_quality_modes.dart';
import 'package:meta/meta.dart';

sealed class UpdateChannelRequest {
  const UpdateChannelRequest();

  factory UpdateChannelRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('icon')) {
      return UpdateGroupDmRequestPartial.fromJson(json);
    }
    if (json.containsKey('available_tags')) {
      return UpdateGuildChannelRequestPartial.fromJson(json);
    }
    if (json.containsKey('applied_tags')) {
      return UpdateThreadRequestPartial.fromJson(json);
    }
    return UpdateDmRequestPartial.fromJson(json);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateChannelRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateChannelRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class UpdateDmRequestPartial extends UpdateChannelRequest {
  const UpdateDmRequestPartial({this.name});

  /// Converts a `Map<String, dynamic>` to a [UpdateDmRequestPartial].
  factory UpdateDmRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateDmRequestPartial',
      json,
      () => UpdateDmRequestPartial(name: json['name'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateDmRequestPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateDmRequestPartial.fromJson(json);
  }

  final String? name;

  /// Converts a [UpdateDmRequestPartial] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateDmRequestPartial && name == other.name;
  }
}

@immutable
final class UpdateGroupDmRequestPartial extends UpdateChannelRequest {
  const UpdateGroupDmRequestPartial({this.name, this.icon});

  /// Converts a `Map<String, dynamic>` to a [UpdateGroupDmRequestPartial].
  factory UpdateGroupDmRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGroupDmRequestPartial',
      json,
      () => UpdateGroupDmRequestPartial(
        name: json['name'] as String?,
        icon: maybeBase64Decode(json['icon'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGroupDmRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateGroupDmRequestPartial.fromJson(json);
  }

  final String? name;
  final Uint8List? icon;

  /// Converts a [UpdateGroupDmRequestPartial] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'icon': maybeBase64Encode(icon)};
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(icon)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGroupDmRequestPartial &&
        name == other.name &&
        listsEqual(icon, other.icon);
  }
}

@immutable
final class UpdateGuildChannelRequestPartial extends UpdateChannelRequest {
  const UpdateGuildChannelRequestPartial({
    this.type,
    this.name,
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
    this.flags,
    this.availableTags,
  });

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildChannelRequestPartial].
  factory UpdateGuildChannelRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildChannelRequestPartial',
      json,
      () => UpdateGuildChannelRequestPartial(
        type: ChannelTypes.maybeFromJson(json['type'] as int?),
        name: json['name'] as String?,
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
        flags: json['flags'] as int?,
        availableTags: (json['available_tags'] as List?)
            ?.map<UpdateThreadTagRequest>(
              (e) => UpdateThreadTagRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildChannelRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateGuildChannelRequestPartial.fromJson(json);
  }

  final ChannelTypes? type;
  final String? name;
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
  final int? flags;
  final List<UpdateThreadTagRequest>? availableTags;

  /// Converts a [UpdateGuildChannelRequestPartial] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type?.toJson(),
      'name': ?name,
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
      'flags': flags,
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
    flags,
    listHash(availableTags),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildChannelRequestPartial &&
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
        flags == other.flags &&
        listsEqual(availableTags, other.availableTags);
  }
}

@immutable
final class UpdateThreadRequestPartial extends UpdateChannelRequest {
  const UpdateThreadRequestPartial({
    this.name,
    this.archived,
    this.locked,
    this.invitable,
    this.autoArchiveDuration,
    this.rateLimitPerUser,
    this.flags,
    this.appliedTags,
    this.bitrate,
    this.userLimit,
    this.rtcRegion,
    this.videoQualityMode,
  });

  /// Converts a `Map<String, dynamic>` to a [UpdateThreadRequestPartial].
  factory UpdateThreadRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateThreadRequestPartial',
      json,
      () => UpdateThreadRequestPartial(
        name: json['name'] as String?,
        archived: json['archived'] as bool?,
        locked: json['locked'] as bool?,
        invitable: json['invitable'] as bool?,
        autoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['auto_archive_duration'] as int?,
        ),
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
        flags: json['flags'] as int?,
        appliedTags: (json['applied_tags'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        bitrate: json['bitrate'] as int?,
        userLimit: json['user_limit'] as int?,
        rtcRegion: json['rtc_region'] as String?,
        videoQualityMode: VideoQualityModes.maybeFromJson(
          json['video_quality_mode'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateThreadRequestPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateThreadRequestPartial.fromJson(json);
  }

  final String? name;
  final bool? archived;
  final bool? locked;
  final bool? invitable;
  final ThreadAutoArchiveDuration? autoArchiveDuration;
  final int? rateLimitPerUser;
  final int? flags;
  final List<SnowflakeType>? appliedTags;
  final int? bitrate;
  final int? userLimit;
  final String? rtcRegion;
  final VideoQualityModes? videoQualityMode;

  /// Converts a [UpdateThreadRequestPartial] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'archived': archived,
      'locked': locked,
      'invitable': invitable,
      'auto_archive_duration': autoArchiveDuration?.toJson(),
      'rate_limit_per_user': rateLimitPerUser,
      'flags': flags,
      'applied_tags': appliedTags?.map((e) => e.toJson()).toList(),
      'bitrate': bitrate,
      'user_limit': userLimit,
      'rtc_region': rtcRegion,
      'video_quality_mode': videoQualityMode?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    archived,
    locked,
    invitable,
    autoArchiveDuration,
    rateLimitPerUser,
    flags,
    listHash(appliedTags),
    bitrate,
    userLimit,
    rtcRegion,
    videoQualityMode,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateThreadRequestPartial &&
        name == other.name &&
        archived == other.archived &&
        locked == other.locked &&
        invitable == other.invitable &&
        autoArchiveDuration == other.autoArchiveDuration &&
        rateLimitPerUser == other.rateLimitPerUser &&
        flags == other.flags &&
        listsEqual(appliedTags, other.appliedTags) &&
        bitrate == other.bitrate &&
        userLimit == other.userLimit &&
        rtcRegion == other.rtcRegion &&
        videoQualityMode == other.videoQualityMode;
  }
}
