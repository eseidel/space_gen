import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_event_type.dart';
import 'package:discord/models/automod_trigger_type.dart';
import 'package:discord/models/ml_spam_trigger_metadata.dart';
import 'package:discord/models/ml_spam_upsert_request_partial_actions_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MlSpamUpsertRequestPartial {
  const MlSpamUpsertRequestPartial({
    this.name,
    this.eventType,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
    this.triggerMetadata,
  });

  /// Converts a `Map<String, dynamic>` to a [MlSpamUpsertRequestPartial].
  factory MlSpamUpsertRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MlSpamUpsertRequestPartial',
      json,
      () => MlSpamUpsertRequestPartial(
        name: json['name'] as String?,
        eventType: AutomodEventType.maybeFromJson(json['event_type'] as int?),
        actions: (json['actions'] as List?)
            ?.map<MlSpamUpsertRequestPartialActionsInner>(
              (e) => MlSpamUpsertRequestPartialActionsInner.fromJson(
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
  static MlSpamUpsertRequestPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MlSpamUpsertRequestPartial.fromJson(json);
  }

  final String? name;
  final AutomodEventType? eventType;
  final List<MlSpamUpsertRequestPartialActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  AutomodTriggerType get triggerType => AutomodTriggerType.mlSpam;
  final MlSpamTriggerMetadata? triggerMetadata;

  /// Converts a [MlSpamUpsertRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (eventType != null) 'event_type': eventType?.toJson(),
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
    return other is MlSpamUpsertRequestPartial &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerMetadata == other.triggerMetadata;
  }
}
