import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_event_type.dart';
import 'package:discord/models/automod_trigger_type.dart';
import 'package:discord/models/keyword_trigger_metadata.dart';
import 'package:discord/models/keyword_upsert_request_partial_actions_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class KeywordUpsertRequestPartial {
  KeywordUpsertRequestPartial({
    this.name,
    this.eventType,
    this.actions,
    this.enabled,
    this.exemptRoles,
    this.exemptChannels,
    this.triggerType,
    this.triggerMetadata,
  }) {
    name?.validate(maxLength: 100);
    actions?.validate(minItems: 1, maxItems: 5);
    exemptRoles?.validate(maxItems: 20, unique: true);
    exemptChannels?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [KeywordUpsertRequestPartial].
  factory KeywordUpsertRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeywordUpsertRequestPartial',
      json,
      () => KeywordUpsertRequestPartial(
        name: json['name'] as String?,
        eventType: AutomodEventType.maybeFromJson(json['event_type'] as int?),
        actions: (json['actions'] as List?)
            ?.map<KeywordUpsertRequestPartialActionsInner>(
              (e) => KeywordUpsertRequestPartialActionsInner.fromJson(
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
        triggerType: AutomodTriggerType.maybeFromJson(
          json['trigger_type'] as int?,
        ),
        triggerMetadata: KeywordTriggerMetadata.maybeFromJson(
          json['trigger_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordUpsertRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return KeywordUpsertRequestPartial.fromJson(json);
  }

  final String? name;
  final AutomodEventType? eventType;
  final List<KeywordUpsertRequestPartialActionsInner>? actions;
  final bool? enabled;
  final List<SnowflakeType>? exemptRoles;
  final List<SnowflakeType>? exemptChannels;
  final AutomodTriggerType? triggerType;
  final KeywordTriggerMetadata? triggerMetadata;

  /// Converts a [KeywordUpsertRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'event_type': ?eventType?.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'exempt_roles': exemptRoles?.map((e) => e.toJson()).toList(),
      'exempt_channels': exemptChannels?.map((e) => e.toJson()).toList(),
      'trigger_type': ?triggerType?.toJson(),
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
    triggerType,
    triggerMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequestPartial &&
        name == other.name &&
        eventType == other.eventType &&
        listsEqual(actions, other.actions) &&
        enabled == other.enabled &&
        listsEqual(exemptRoles, other.exemptRoles) &&
        listsEqual(exemptChannels, other.exemptChannels) &&
        triggerType == other.triggerType &&
        triggerMetadata == other.triggerMetadata;
  }
}
