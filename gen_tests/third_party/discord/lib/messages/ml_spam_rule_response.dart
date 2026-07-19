import 'package:discord/messages/ml_spam_trigger_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_event_type.dart';
import 'package:discord/models/automod_trigger_type.dart';
import 'package:discord/models/ml_spam_rule_response_actions_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MlSpamRuleResponse {
  const MlSpamRuleResponse({
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
  });

  /// Converts a `Map<String, dynamic>` to a [MlSpamRuleResponse].
  factory MlSpamRuleResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MlSpamRuleResponse',
      json,
      () => MlSpamRuleResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        creatorId: SnowflakeType.fromJson(json['creator_id'] as String),
        name: json['name'] as String,
        eventType: AutomodEventType.fromJson(json['event_type'] as int),
        actions: (json['actions'] as List)
            .map<MlSpamRuleResponseActionsInner>(
              (e) => MlSpamRuleResponseActionsInner.fromJson(
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
        triggerMetadata: MlSpamTriggerMetadataResponse.fromJson(
          json['trigger_metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamRuleResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MlSpamRuleResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType guildId;
  final SnowflakeType creatorId;
  final String name;
  final AutomodEventType eventType;
  final List<MlSpamRuleResponseActionsInner> actions;
  AutomodTriggerType get triggerType => AutomodTriggerType.mlSpam;
  final bool enabled;
  final List<SnowflakeType> exemptRoles;
  final List<SnowflakeType> exemptChannels;
  final MlSpamTriggerMetadataResponse triggerMetadata;

  /// Converts a [MlSpamRuleResponse] to a `Map<String, dynamic>`.
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
    return other is MlSpamRuleResponse &&
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
