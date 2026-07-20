import 'package:discord/api_exception.dart';
import 'package:discord/messages/keyword_trigger_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_event_type.dart';
import 'package:discord/models/automod_trigger_type.dart';
import 'package:discord/models/keyword_rule_response_actions_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class KeywordRuleResponse {
  KeywordRuleResponse({
    required this.id,
    required this.guildId,
    required this.creatorId,
    required this.name,
    required this.eventType,
    required this.actions,
    required this.enabled,
    required this.exemptRoles,
    required this.exemptChannels,
    required this.triggerMetadata,
  }) {
    exemptRoles.validate(unique: true);
    exemptChannels.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [KeywordRuleResponse].
  factory KeywordRuleResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeywordRuleResponse',
      json,
      () => KeywordRuleResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        creatorId: SnowflakeType.fromJson(json['creator_id'] as String),
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List)
            .map<KeywordRuleResponseActionsInner>(
              (e) => KeywordRuleResponseActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool,
        exemptRoles: (json['exempt_roles'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        exemptChannels: (json['exempt_channels'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        triggerMetadata: KeywordTriggerMetadataResponse.fromJson(
          json['trigger_metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordRuleResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return KeywordRuleResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType guildId;
  final SnowflakeType creatorId;
  final String name;
  final AutomodEventType eventType;
  final List<KeywordRuleResponseActionsInner> actions;
  AutomodTriggerType get triggerType => AutomodTriggerType.keyword;
  final bool enabled;
  final List<SnowflakeType> exemptRoles;
  final List<SnowflakeType> exemptChannels;
  final KeywordTriggerMetadataResponse triggerMetadata;

  /// Converts a [KeywordRuleResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'guild_id': guildId.toJson(),
      'creator_id': creatorId.toJson(),
      'name': name,
      'event_type': eventType.toJson(),
      'actions': actions.map((e) => e.toJson()).toList(),
      'trigger_type': triggerType.toJson(),
      'enabled': enabled,
      'exempt_roles': exemptRoles.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels.map((e) => e.toJson()).toList(),
      'trigger_metadata': triggerMetadata.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    guildId,
    creatorId,
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
    return other is KeywordRuleResponse &&
        id == other.id &&
        guildId == other.guildId &&
        creatorId == other.creatorId &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}
