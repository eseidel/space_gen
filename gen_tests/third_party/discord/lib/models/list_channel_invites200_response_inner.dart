import 'package:discord/messages/invite_application_response.dart';
import 'package:discord/messages/invite_channel_response.dart';
import 'package:discord/messages/invite_guild_response.dart';
import 'package:discord/messages/invite_guild_role_response.dart';
import 'package:discord/messages/scheduled_event_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/invite_target_types.dart';
import 'package:discord/models/invite_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class ListChannelInvites200ResponseInner {
  const ListChannelInvites200ResponseInner();

  factory ListChannelInvites200ResponseInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => FriendInviteResponse.fromJson(json),
      1 => GroupDmInviteResponse.fromJson(json),
      0 => GuildInviteResponse.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ListChannelInvites200ResponseInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListChannelInvites200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListChannelInvites200ResponseInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class FriendInviteResponse extends ListChannelInvites200ResponseInner {
  const FriendInviteResponse({
    required this.code,
    required this.expiresAt,
    required this.channel,
    this.inviter,
    this.maxAge,
    this.createdAt,
    this.friendsCount,
    this.isContact,
    this.uses,
    this.maxUses,
    this.flags,
  });

  /// Converts a `Map<String, dynamic>` to a [FriendInviteResponse].
  factory FriendInviteResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FriendInviteResponse',
      json,
      () => FriendInviteResponse(
        code: json['code'] as String,
        inviter: UserResponse.maybeFromJson(
          json['inviter'] as Map<String, dynamic>?,
        ),
        maxAge: json['max_age'] as int?,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        expiresAt: maybeParseDateTime(
          checkedKey(json, 'expires_at') as String?,
        ),
        friendsCount: json['friends_count'] as int?,
        channel: InviteChannelResponse.maybeFromJson(
          checkedKey(json, 'channel') as Map<String, dynamic>?,
        ),
        isContact: json['is_contact'] as bool?,
        uses: json['uses'] as int?,
        maxUses: json['max_uses'] as int?,
        flags: json['flags'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FriendInviteResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FriendInviteResponse.fromJson(json);
  }

  InviteTypes get type => InviteTypes.friend;
  final String code;
  final UserResponse? inviter;
  final int? maxAge;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final int? friendsCount;
  final InviteChannelResponse? channel;
  final bool? isContact;
  final int? uses;
  final int? maxUses;
  final int? flags;

  /// Converts a [FriendInviteResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'code': code,
      'inviter': ?inviter?.toJson(),
      'max_age': ?maxAge,
      'created_at': ?createdAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'friends_count': ?friendsCount,
      'channel': channel?.toJson(),
      'is_contact': ?isContact,
      'uses': ?uses,
      'max_uses': ?maxUses,
      'flags': ?flags,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    code,
    inviter,
    maxAge,
    createdAt,
    expiresAt,
    friendsCount,
    channel,
    isContact,
    uses,
    maxUses,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FriendInviteResponse &&
        code == other.code &&
        inviter == other.inviter &&
        maxAge == other.maxAge &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        friendsCount == other.friendsCount &&
        channel == other.channel &&
        isContact == other.isContact &&
        uses == other.uses &&
        maxUses == other.maxUses &&
        flags == other.flags;
  }
}

@immutable
final class GroupDmInviteResponse extends ListChannelInvites200ResponseInner {
  const GroupDmInviteResponse({
    required this.code,
    required this.expiresAt,
    required this.channel,
    this.inviter,
    this.maxAge,
    this.createdAt,
    this.approximateMemberCount,
  });

  /// Converts a `Map<String, dynamic>` to a [GroupDmInviteResponse].
  factory GroupDmInviteResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GroupDmInviteResponse',
      json,
      () => GroupDmInviteResponse(
        code: json['code'] as String,
        inviter: UserResponse.maybeFromJson(
          json['inviter'] as Map<String, dynamic>?,
        ),
        maxAge: json['max_age'] as int?,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        expiresAt: maybeParseDateTime(
          checkedKey(json, 'expires_at') as String?,
        ),
        channel: InviteChannelResponse.fromJson(
          json['channel'] as Map<String, dynamic>,
        ),
        approximateMemberCount: json['approximate_member_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GroupDmInviteResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GroupDmInviteResponse.fromJson(json);
  }

  InviteTypes get type => InviteTypes.groupDm;
  final String code;
  final UserResponse? inviter;
  final int? maxAge;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final InviteChannelResponse channel;
  final int? approximateMemberCount;

  /// Converts a [GroupDmInviteResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'code': code,
      'inviter': ?inviter?.toJson(),
      'max_age': ?maxAge,
      'created_at': ?createdAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'channel': channel.toJson(),
      'approximate_member_count': approximateMemberCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    code,
    inviter,
    maxAge,
    createdAt,
    expiresAt,
    channel,
    approximateMemberCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GroupDmInviteResponse &&
        code == other.code &&
        inviter == other.inviter &&
        maxAge == other.maxAge &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        channel == other.channel &&
        approximateMemberCount == other.approximateMemberCount;
  }
}

@immutable
final class GuildInviteResponse extends ListChannelInvites200ResponseInner {
  const GuildInviteResponse({
    required this.code,
    required this.expiresAt,
    required this.guild,
    required this.guildId,
    required this.channel,
    this.inviter,
    this.maxAge,
    this.createdAt,
    this.isContact,
    this.flags,
    this.targetType,
    this.targetUser,
    this.targetApplication,
    this.guildScheduledEvent,
    this.uses,
    this.maxUses,
    this.temporary,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.isNicknameChangeable,
    this.roles,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildInviteResponse].
  factory GuildInviteResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildInviteResponse',
      json,
      () => GuildInviteResponse(
        code: json['code'] as String,
        inviter: UserResponse.maybeFromJson(
          json['inviter'] as Map<String, dynamic>?,
        ),
        maxAge: json['max_age'] as int?,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        expiresAt: maybeParseDateTime(
          checkedKey(json, 'expires_at') as String?,
        ),
        isContact: json['is_contact'] as bool?,
        flags: json['flags'] as int?,
        guild: InviteGuildResponse.fromJson(
          json['guild'] as Map<String, dynamic>,
        ),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        channel: InviteChannelResponse.fromJson(
          json['channel'] as Map<String, dynamic>,
        ),
        targetType: InviteTargetTypes.maybeFromJson(
          json['target_type'] as int?,
        ),
        targetUser: UserResponse.maybeFromJson(
          json['target_user'] as Map<String, dynamic>?,
        ),
        targetApplication: InviteApplicationResponse.maybeFromJson(
          json['target_application'] as Map<String, dynamic>?,
        ),
        guildScheduledEvent: ScheduledEventResponse.maybeFromJson(
          json['guild_scheduled_event'] as Map<String, dynamic>?,
        ),
        uses: json['uses'] as int?,
        maxUses: json['max_uses'] as int?,
        temporary: json['temporary'] as bool?,
        approximateMemberCount: json['approximate_member_count'] as int?,
        approximatePresenceCount: json['approximate_presence_count'] as int?,
        isNicknameChangeable: json['is_nickname_changeable'] as bool?,
        roles: (json['roles'] as List?)
            ?.map<InviteGuildRoleResponse>(
              (e) =>
                  InviteGuildRoleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildInviteResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildInviteResponse.fromJson(json);
  }

  InviteTypes get type => InviteTypes.guild;
  final String code;
  final UserResponse? inviter;
  final int? maxAge;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final bool? isContact;
  final int? flags;
  final InviteGuildResponse guild;
  final SnowflakeType guildId;
  final InviteChannelResponse channel;
  final InviteTargetTypes? targetType;
  final UserResponse? targetUser;
  final InviteApplicationResponse? targetApplication;
  final ScheduledEventResponse? guildScheduledEvent;
  final int? uses;
  final int? maxUses;
  final bool? temporary;
  final int? approximateMemberCount;
  final int? approximatePresenceCount;
  final bool? isNicknameChangeable;
  final List<InviteGuildRoleResponse>? roles;

  /// Converts a [GuildInviteResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'code': code,
      'inviter': ?inviter?.toJson(),
      'max_age': ?maxAge,
      'created_at': ?createdAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'is_contact': ?isContact,
      'flags': ?flags,
      'guild': guild.toJson(),
      'guild_id': guildId.toJson(),
      'channel': channel.toJson(),
      'target_type': ?targetType?.toJson(),
      'target_user': ?targetUser?.toJson(),
      'target_application': ?targetApplication?.toJson(),
      'guild_scheduled_event': ?guildScheduledEvent?.toJson(),
      'uses': ?uses,
      'max_uses': ?maxUses,
      'temporary': ?temporary,
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
      'is_nickname_changeable': ?isNicknameChangeable,
      'roles': roles?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    code,
    inviter,
    maxAge,
    createdAt,
    expiresAt,
    isContact,
    flags,
    guild,
    guildId,
    channel,
    targetType,
    targetUser,
    targetApplication,
    guildScheduledEvent,
    uses,
    maxUses,
    temporary,
    approximateMemberCount,
    approximatePresenceCount,
    isNicknameChangeable,
    listHash(roles),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildInviteResponse &&
        code == other.code &&
        inviter == other.inviter &&
        maxAge == other.maxAge &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        isContact == other.isContact &&
        flags == other.flags &&
        guild == other.guild &&
        guildId == other.guildId &&
        channel == other.channel &&
        targetType == other.targetType &&
        targetUser == other.targetUser &&
        targetApplication == other.targetApplication &&
        guildScheduledEvent == other.guildScheduledEvent &&
        uses == other.uses &&
        maxUses == other.maxUses &&
        temporary == other.temporary &&
        approximateMemberCount == other.approximateMemberCount &&
        approximatePresenceCount == other.approximatePresenceCount &&
        isNicknameChangeable == other.isNicknameChangeable &&
        listsEqual(roles, other.roles);
  }
}
