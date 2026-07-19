import 'package:discord/messages/application_command_response.dart';
import 'package:discord/messages/audit_log_entry_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_audit_log_response_auto_moderation_rules_inner.dart';
import 'package:discord/models/guild_audit_log_response_guild_scheduled_events_inner.dart';
import 'package:discord/models/guild_audit_log_response_integrations_inner.dart';
import 'package:discord/models/guild_audit_log_response_webhooks_inner.dart';
import 'package:meta/meta.dart';

@immutable
class GuildAuditLogResponse {
  const GuildAuditLogResponse({
    required this.auditLogEntries,
    required this.users,
    required this.integrations,
    required this.webhooks,
    required this.guildScheduledEvents,
    required this.threads,
    required this.applicationCommands,
    required this.autoModerationRules,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildAuditLogResponse].
  factory GuildAuditLogResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildAuditLogResponse',
      json,
      () => GuildAuditLogResponse(
        auditLogEntries: (json['audit_log_entries'] as List)
            .map<AuditLogEntryResponse>(
              (e) => AuditLogEntryResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        users: (json['users'] as List)
            .map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        integrations: (json['integrations'] as List)
            .map<GuildAuditLogResponseIntegrationsInner>(
              (e) => GuildAuditLogResponseIntegrationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        webhooks: (json['webhooks'] as List)
            .map<GuildAuditLogResponseWebhooksInner>(
              (e) => GuildAuditLogResponseWebhooksInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        guildScheduledEvents: (json['guild_scheduled_events'] as List)
            .map<GuildAuditLogResponseGuildScheduledEventsInner>(
              (e) => GuildAuditLogResponseGuildScheduledEventsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        threads: (json['threads'] as List)
            .map<ThreadResponse>(
              (e) => ThreadResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        applicationCommands: (json['application_commands'] as List)
            .map<ApplicationCommandResponse>(
              (e) => ApplicationCommandResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        autoModerationRules: (json['auto_moderation_rules'] as List)
            .map<GuildAuditLogResponseAutoModerationRulesInner>(
              (e) => GuildAuditLogResponseAutoModerationRulesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildAuditLogResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildAuditLogResponse.fromJson(json);
  }

  final List<AuditLogEntryResponse> auditLogEntries;
  final List<UserResponse> users;
  final List<GuildAuditLogResponseIntegrationsInner> integrations;
  final List<GuildAuditLogResponseWebhooksInner> webhooks;
  final List<GuildAuditLogResponseGuildScheduledEventsInner>
  guildScheduledEvents;
  final List<ThreadResponse> threads;
  final List<ApplicationCommandResponse> applicationCommands;
  final List<GuildAuditLogResponseAutoModerationRulesInner> autoModerationRules;

  /// Converts a [GuildAuditLogResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'audit_log_entries': auditLogEntries.map((e) => e.toJson()).toList(),
      'users': users.map((e) => e.toJson()).toList(),
      'integrations': integrations.map((e) => e.toJson()).toList(),
      'webhooks': webhooks.map((e) => e.toJson()).toList(),
      'guild_scheduled_events': guildScheduledEvents
          .map((e) => e.toJson())
          .toList(),
      'threads': threads.map((e) => e.toJson()).toList(),
      'application_commands': applicationCommands
          .map((e) => e.toJson())
          .toList(),
      'auto_moderation_rules': autoModerationRules
          .map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(auditLogEntries),
    listHash(users),
    listHash(integrations),
    listHash(webhooks),
    listHash(guildScheduledEvents),
    listHash(threads),
    listHash(applicationCommands),
    listHash(autoModerationRules),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildAuditLogResponse &&
        listsEqual(auditLogEntries, other.auditLogEntries) &&
        listsEqual(users, other.users) &&
        listsEqual(integrations, other.integrations) &&
        listsEqual(webhooks, other.webhooks) &&
        listsEqual(guildScheduledEvents, other.guildScheduledEvents) &&
        listsEqual(threads, other.threads) &&
        listsEqual(applicationCommands, other.applicationCommands) &&
        listsEqual(autoModerationRules, other.autoModerationRules);
  }
}
