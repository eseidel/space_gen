import 'package:discord/messages/audit_log_object_change_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/audit_log_action_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class AuditLogEntryResponse {
  const AuditLogEntryResponse({
    required this.id,
    required this.actionType,
    required this.userId,
    required this.targetId,
    this.changes,
    this.options,
    this.reason,
  });

  /// Converts a `Map<String, dynamic>` to an [AuditLogEntryResponse].
  factory AuditLogEntryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AuditLogEntryResponse',
      json,
      () => AuditLogEntryResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        actionType: AuditLogActionTypes.fromJson(json['action_type'] as int),
        userId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'user_id') as String?,
        ),
        targetId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'target_id') as String?,
        ),
        changes: (json['changes'] as List?)
            ?.map<AuditLogObjectChangeResponse>(
              (e) => AuditLogObjectChangeResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        options: (json['options'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        reason: json['reason'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AuditLogEntryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AuditLogEntryResponse.fromJson(json);
  }

  final SnowflakeType id;
  final AuditLogActionTypes actionType;
  final SnowflakeType? userId;
  final SnowflakeType? targetId;
  final List<AuditLogObjectChangeResponse>? changes;
  final Map<String, String>? options;
  final String? reason;

  /// Converts an [AuditLogEntryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'action_type': actionType.toJson(),
      'user_id': userId?.toJson(),
      'target_id': targetId?.toJson(),
      'changes': changes?.map((e) => e.toJson()).toList(),
      'options': options,
      'reason': reason,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    actionType,
    userId,
    targetId,
    listHash(changes),
    mapHash(options),
    reason,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuditLogEntryResponse &&
        id == other.id &&
        actionType == other.actionType &&
        userId == other.userId &&
        targetId == other.targetId &&
        listsEqual(changes, other.changes) &&
        mapsEqual(options, other.options) &&
        reason == other.reason;
  }
}
