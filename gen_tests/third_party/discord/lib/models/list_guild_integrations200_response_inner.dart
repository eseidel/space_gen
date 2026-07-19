import 'package:discord/messages/account_response.dart';
import 'package:discord/messages/integration_application_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/integration_expire_behavior_types.dart';
import 'package:discord/models/integration_expire_grace_period_types.dart';
import 'package:discord/models/integration_types.dart';
import 'package:discord/models/o_auth2_scopes.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class ListGuildIntegrations200ResponseInner {
  const ListGuildIntegrations200ResponseInner();

  factory ListGuildIntegrations200ResponseInner.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('application')) {
      return DiscordIntegrationResponse.fromJson(json);
    }
    if (json.containsKey('enable_emoticons')) {
      return ExternalConnectionIntegrationResponse.fromJson(json);
    }
    return GuildSubscriptionIntegrationResponse.fromJson(json);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListGuildIntegrations200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListGuildIntegrations200ResponseInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class DiscordIntegrationResponse
    extends ListGuildIntegrations200ResponseInner {
  const DiscordIntegrationResponse({
    required this.name,
    required this.account,
    required this.enabled,
    required this.id,
    required this.application,
    required this.scopes,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [DiscordIntegrationResponse].
  factory DiscordIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DiscordIntegrationResponse',
      json,
      () => DiscordIntegrationResponse(
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
        enabled: json['enabled'] as bool,
        id: SnowflakeType.fromJson(json['id'] as String),
        application: IntegrationApplicationResponse.fromJson(
          json['application'] as Map<String, dynamic>,
        ),
        scopes: (json['scopes'] as List)
            .map<OAuth2Scopes>((e) => OAuth2Scopes.fromJson(e as String))
            .toList(),
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DiscordIntegrationResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DiscordIntegrationResponse.fromJson(json);
  }

  IntegrationTypes get type => IntegrationTypes.discord;
  final String? name;
  final AccountResponse account;
  final bool enabled;
  final SnowflakeType id;
  final IntegrationApplicationResponse application;
  final List<OAuth2Scopes> scopes;
  final UserResponse? user;

  /// Converts a [DiscordIntegrationResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'account': account.toJson(),
      'enabled': enabled,
      'id': id.toJson(),
      'application': application.toJson(),
      'scopes': scopes.map((e) => e.toJson()).toList(),
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    account,
    enabled,
    id,
    application,
    listHash(scopes),
    user,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DiscordIntegrationResponse &&
        name == other.name &&
        account == other.account &&
        enabled == other.enabled &&
        id == other.id &&
        application == other.application &&
        listsEqual(scopes, other.scopes) &&
        user == other.user;
  }
}

@immutable
final class ExternalConnectionIntegrationResponse
    extends ListGuildIntegrations200ResponseInner {
  const ExternalConnectionIntegrationResponse({
    required this.type,
    required this.name,
    required this.account,
    required this.enabled,
    required this.id,
    required this.user,
    this.revoked,
    this.expireBehavior,
    this.expireGracePeriod,
    this.subscriberCount,
    this.syncedAt,
    this.roleId,
    this.syncing,
    this.enableEmoticons,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ExternalConnectionIntegrationResponse].
  factory ExternalConnectionIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ExternalConnectionIntegrationResponse',
      json,
      () => ExternalConnectionIntegrationResponse(
        type: IntegrationTypes.fromJson(json['type'] as String),
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
        enabled: json['enabled'] as bool,
        id: json['id'] as String,
        user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
        revoked: json['revoked'] as bool?,
        expireBehavior: IntegrationExpireBehaviorTypes.maybeFromJson(
          json['expire_behavior'] as int?,
        ),
        expireGracePeriod: IntegrationExpireGracePeriodTypes.maybeFromJson(
          json['expire_grace_period'] as int?,
        ),
        subscriberCount: json['subscriber_count'] as int?,
        syncedAt: maybeParseDateTime(json['synced_at'] as String?),
        roleId: SnowflakeType.maybeFromJson(json['role_id'] as String?),
        syncing: json['syncing'] as bool?,
        enableEmoticons: json['enable_emoticons'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExternalConnectionIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExternalConnectionIntegrationResponse.fromJson(json);
  }

  final IntegrationTypes type;
  final String? name;
  final AccountResponse account;
  final bool enabled;
  final String id;
  final UserResponse user;
  final bool? revoked;
  final IntegrationExpireBehaviorTypes? expireBehavior;
  final IntegrationExpireGracePeriodTypes? expireGracePeriod;
  final int? subscriberCount;
  final DateTime? syncedAt;
  final SnowflakeType? roleId;
  final bool? syncing;
  final bool? enableEmoticons;

  /// Converts an [ExternalConnectionIntegrationResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'account': account.toJson(),
      'enabled': enabled,
      'id': id,
      'user': user.toJson(),
      if (revoked != null) 'revoked': revoked,
      if (expireBehavior != null) 'expire_behavior': expireBehavior?.toJson(),
      if (expireGracePeriod != null)
        'expire_grace_period': expireGracePeriod?.toJson(),
      if (subscriberCount != null) 'subscriber_count': subscriberCount,
      if (syncedAt != null) 'synced_at': syncedAt?.toIso8601String(),
      'role_id': roleId?.toJson(),
      if (syncing != null) 'syncing': syncing,
      if (enableEmoticons != null) 'enable_emoticons': enableEmoticons,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    name,
    account,
    enabled,
    id,
    user,
    revoked,
    expireBehavior,
    expireGracePeriod,
    subscriberCount,
    syncedAt,
    roleId,
    syncing,
    enableEmoticons,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExternalConnectionIntegrationResponse &&
        type == other.type &&
        name == other.name &&
        account == other.account &&
        enabled == other.enabled &&
        id == other.id &&
        user == other.user &&
        revoked == other.revoked &&
        expireBehavior == other.expireBehavior &&
        expireGracePeriod == other.expireGracePeriod &&
        subscriberCount == other.subscriberCount &&
        syncedAt == other.syncedAt &&
        roleId == other.roleId &&
        syncing == other.syncing &&
        enableEmoticons == other.enableEmoticons;
  }
}

@immutable
final class GuildSubscriptionIntegrationResponse
    extends ListGuildIntegrations200ResponseInner {
  const GuildSubscriptionIntegrationResponse({
    required this.name,
    required this.account,
    required this.enabled,
    required this.id,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GuildSubscriptionIntegrationResponse].
  factory GuildSubscriptionIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GuildSubscriptionIntegrationResponse',
      json,
      () => GuildSubscriptionIntegrationResponse(
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
        enabled: json['enabled'] as bool,
        id: SnowflakeType.fromJson(json['id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildSubscriptionIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildSubscriptionIntegrationResponse.fromJson(json);
  }

  IntegrationTypes get type => IntegrationTypes.guildSubscription;
  final String? name;
  final AccountResponse account;
  final bool enabled;
  final SnowflakeType id;

  /// Converts a [GuildSubscriptionIntegrationResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'account': account.toJson(),
      'enabled': enabled,
      'id': id.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, account, enabled, id]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildSubscriptionIntegrationResponse &&
        name == other.name &&
        account == other.account &&
        enabled == other.enabled &&
        id == other.id;
  }
}
