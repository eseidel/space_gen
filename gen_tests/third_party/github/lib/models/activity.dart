import 'package:github/model_helpers.dart';
import 'package:github/models/activity_activity_type.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template activity}
/// Activity
/// Activity
/// {@endtemplate}
@immutable
class Activity {
  /// {@macro activity}
  const Activity({
    required this.id,
    required this.nodeId,
    required this.before,
    required this.after,
    required this.ref,
    required this.timestamp,
    required this.activityType,
    required this.actor,
  });

  /// Converts a `Map<String, dynamic>` to an [Activity].
  factory Activity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Activity',
      json,
      () => Activity(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        before: json['before'] as String,
        after: json['after'] as String,
        ref: json['ref'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        activityType: ActivityActivityType.fromJson(
          json['activity_type'] as String,
        ),
        actor: SimpleUser.maybeFromJson(
          checkedKey(json, 'actor') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Activity? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Activity.fromJson(json);
  }

  /// Example: `1296269`
  final int id;

  /// Example: `'MDEwOlJlcG9zaXRvcnkxMjk2MjY5'`
  final String nodeId;

  /// The SHA of the commit before the activity.
  /// Example: `'6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String before;

  /// The SHA of the commit after the activity.
  /// Example: `'827efc6d56897b048c772eb4087f854f46256132'`
  final String after;

  /// The full Git reference, formatted as `refs/heads/<branch name>`.
  /// Example: `'refs/heads/main'`
  final String ref;

  /// The time when the activity occurred.
  /// Example: `'2011-01-26T19:06:43Z'`
  final DateTime timestamp;

  /// The type of the activity that was performed.
  /// Example: `'force_push'`
  final ActivityActivityType activityType;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? actor;

  /// Converts an [Activity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'before': before,
      'after': after,
      'ref': ref,
      'timestamp': timestamp.toIso8601String(),
      'activity_type': activityType.toJson(),
      'actor': actor?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    before,
    after,
    ref,
    timestamp,
    activityType,
    actor,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Activity &&
        id == other.id &&
        nodeId == other.nodeId &&
        before == other.before &&
        after == other.after &&
        ref == other.ref &&
        timestamp == other.timestamp &&
        activityType == other.activityType &&
        actor == other.actor;
  }
}
