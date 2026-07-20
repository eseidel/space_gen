// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_event_type.dart';
import 'package:discord/models/automod_trigger_type.dart';
import 'package:discord/models/default_keyword_list_trigger_metadata.dart';
import 'package:discord/models/default_keyword_list_upsert_request_actions_inner.dart';
import 'package:discord/models/keyword_trigger_metadata.dart';
import 'package:discord/models/keyword_upsert_request_actions_inner.dart';
import 'package:discord/models/mention_spam_trigger_metadata.dart';
import 'package:discord/models/mention_spam_upsert_request_actions_inner.dart';
import 'package:discord/models/ml_spam_trigger_metadata.dart';
import 'package:discord/models/ml_spam_upsert_request_actions_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class CreateAutoModerationRuleRequest {
  const CreateAutoModerationRuleRequest();

  factory CreateAutoModerationRuleRequest.fromJson(Map<String, dynamic> json) {
    final discriminator = json['trigger_type'];
    return switch (discriminator) {
      4 => DefaultKeywordListUpsertRequest.fromJson(json),
      1 => KeywordUpsertRequest.fromJson(json),
      3 => MlSpamUpsertRequest.fromJson(json),
      5 => MentionSpamUpsertRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown trigger_type '$discriminator' for CreateAutoModerationRuleRequest",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateAutoModerationRuleRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateAutoModerationRuleRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class DefaultKeywordListUpsertRequest
    extends CreateAutoModerationRuleRequest {
  DefaultKeywordListUpsertRequest({
    required this.name,
    required this.eventType,
    required this.triggerMetadata,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
  }) {
    name.validate(maxLength: 100);
    actions?.validate(minItems: 1, maxItems: 5);
    exemptRoles?.validate(maxItems: 20, unique: true);
    exemptChannels?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [DefaultKeywordListUpsertRequest].
  factory DefaultKeywordListUpsertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DefaultKeywordListUpsertRequest',
      json,
      () => DefaultKeywordListUpsertRequest(
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List?)
            ?.map<DefaultKeywordListUpsertRequestActionsInner>(
              (e) => DefaultKeywordListUpsertRequestActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
        exemptRoles: (json['exempt_roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        exemptChannels: (json['exempt_channels'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        triggerMetadata: DefaultKeywordListTriggerMetadata.fromJson(
          json['trigger_metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultKeywordListUpsertRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultKeywordListUpsertRequest.fromJson(json);
  }

  final String name;
  final AutomodEventType eventType;
  final List<DefaultKeywordListUpsertRequestActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  AutomodTriggerType get triggerType => AutomodTriggerType.defaultKeywordList;
  final DefaultKeywordListTriggerMetadata triggerMetadata;

  /// Converts a [DefaultKeywordListUpsertRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event_type': eventType.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'exempt_roles': exemptRoles?.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels?.map((e) => e.toJson()).toList(),
      'trigger_type': triggerType.toJson(),
      'trigger_metadata': triggerMetadata.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    eventType,
    listHash(actions),
    enabled,
    listHash(exemptRoles),
    listHash(exemptChannels),
    triggerMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DefaultKeywordListUpsertRequest &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}

@immutable
final class KeywordUpsertRequest extends CreateAutoModerationRuleRequest {
  KeywordUpsertRequest({
    required this.name,
    required this.eventType,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
    this.triggerMetadata,
  }) {
    name.validate(maxLength: 100);
    actions?.validate(minItems: 1, maxItems: 5);
    exemptRoles?.validate(maxItems: 20, unique: true);
    exemptChannels?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [KeywordUpsertRequest].
  factory KeywordUpsertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeywordUpsertRequest',
      json,
      () => KeywordUpsertRequest(
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List?)
            ?.map<KeywordUpsertRequestActionsInner>(
              (e) => KeywordUpsertRequestActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
        exemptRoles: (json['exempt_roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        exemptChannels: (json['exempt_channels'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        triggerMetadata: KeywordTriggerMetadata.maybeFromJson(
          json['trigger_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordUpsertRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return KeywordUpsertRequest.fromJson(json);
  }

  final String name;
  final AutomodEventType eventType;
  final List<KeywordUpsertRequestActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  AutomodTriggerType get triggerType => AutomodTriggerType.keyword;
  final KeywordTriggerMetadata? triggerMetadata;

  /// Converts a [KeywordUpsertRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event_type': eventType.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'exempt_roles': exemptRoles?.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels?.map((e) => e.toJson()).toList(),
      'trigger_type': triggerType.toJson(),
      'trigger_metadata': triggerMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    eventType,
    listHash(actions),
    enabled,
    listHash(exemptRoles),
    listHash(exemptChannels),
    triggerMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequest &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}

@immutable
final class MlSpamUpsertRequest extends CreateAutoModerationRuleRequest {
  MlSpamUpsertRequest({
    required this.name,
    required this.eventType,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
    this.triggerMetadata,
  }) {
    name.validate(maxLength: 100);
    actions?.validate(minItems: 1, maxItems: 5);
    exemptRoles?.validate(maxItems: 20, unique: true);
    exemptChannels?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [MlSpamUpsertRequest].
  factory MlSpamUpsertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MlSpamUpsertRequest',
      json,
      () => MlSpamUpsertRequest(
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List?)
            ?.map<MlSpamUpsertRequestActionsInner>(
              (e) => MlSpamUpsertRequestActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
        exemptRoles: (json['exempt_roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        exemptChannels: (json['exempt_channels'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        triggerMetadata: MlSpamTriggerMetadata.maybeFromJson(
          json['trigger_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamUpsertRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MlSpamUpsertRequest.fromJson(json);
  }

  final String name;
  final AutomodEventType eventType;
  final List<MlSpamUpsertRequestActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  AutomodTriggerType get triggerType => AutomodTriggerType.mlSpam;
  final MlSpamTriggerMetadata? triggerMetadata;

  /// Converts a [MlSpamUpsertRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event_type': eventType.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'exempt_roles': exemptRoles?.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels?.map((e) => e.toJson()).toList(),
      'trigger_type': triggerType.toJson(),
      'trigger_metadata': triggerMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    eventType,
    listHash(actions),
    enabled,
    listHash(exemptRoles),
    listHash(exemptChannels),
    triggerMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequest &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}

@immutable
final class MentionSpamUpsertRequest extends CreateAutoModerationRuleRequest {
  MentionSpamUpsertRequest({
    required this.name,
    required this.eventType,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
    this.triggerMetadata,
  }) {
    name.validate(maxLength: 100);
    actions?.validate(minItems: 1, maxItems: 5);
    exemptRoles?.validate(maxItems: 20, unique: true);
    exemptChannels?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [MentionSpamUpsertRequest].
  factory MentionSpamUpsertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MentionSpamUpsertRequest',
      json,
      () => MentionSpamUpsertRequest(
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List?)
            ?.map<MentionSpamUpsertRequestActionsInner>(
              (e) => MentionSpamUpsertRequestActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
        exemptRoles: (json['exempt_roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        exemptChannels: (json['exempt_channels'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        triggerMetadata: MentionSpamTriggerMetadata.maybeFromJson(
          json['trigger_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionSpamUpsertRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MentionSpamUpsertRequest.fromJson(json);
  }

  final String name;
  final AutomodEventType eventType;
  final List<MentionSpamUpsertRequestActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  AutomodTriggerType get triggerType => AutomodTriggerType.mentionSpam;
  final MentionSpamTriggerMetadata? triggerMetadata;

  /// Converts a [MentionSpamUpsertRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event_type': eventType.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'exempt_roles': exemptRoles?.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels?.map((e) => e.toJson()).toList(),
      'trigger_type': triggerType.toJson(),
      'trigger_metadata': triggerMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    eventType,
    listHash(actions),
    enabled,
    listHash(exemptRoles),
    listHash(exemptChannels),
    triggerMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionSpamUpsertRequest &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}
