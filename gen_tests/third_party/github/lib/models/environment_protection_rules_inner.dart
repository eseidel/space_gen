import 'package:github/model_helpers.dart';
import 'package:github/models/environment_protection_rules_inner_any_of_1_reviewers_inner.dart';
import 'package:github/models/wait_timer.dart';
import 'package:meta/meta.dart';

sealed class EnvironmentProtectionRulesInner {
  const EnvironmentProtectionRulesInner();

  factory EnvironmentProtectionRulesInner.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('wait_timer')) {
      return EnvironmentProtectionRulesInnerAnyOf0.fromJson(json);
    }
    if (json.containsKey('prevent_self_review')) {
      return EnvironmentProtectionRulesInnerAnyOf1.fromJson(json);
    }
    return EnvironmentProtectionRulesInnerAnyOf2.fromJson(json);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class EnvironmentProtectionRulesInnerAnyOf0
    extends EnvironmentProtectionRulesInner {
  const EnvironmentProtectionRulesInnerAnyOf0({
    required this.id,
    required this.nodeId,
    required this.type,
    this.waitTimer,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EnvironmentProtectionRulesInnerAnyOf0].
  factory EnvironmentProtectionRulesInnerAnyOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'EnvironmentProtectionRulesInnerAnyOf0',
      json,
      () => EnvironmentProtectionRulesInnerAnyOf0(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        type: json['type'] as String,
        waitTimer: WaitTimer.maybeFromJson(json['wait_timer'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInnerAnyOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInnerAnyOf0.fromJson(json);
  }

  /// Example: `3515`
  final int id;

  /// Example: `'MDQ6R2F0ZTM1MTU='`
  final String nodeId;

  /// Example: `'wait_timer'`
  final String type;

  /// The amount of time to delay a job after the job is initially triggered.
  /// The time (in minutes) must be an integer between 0 and 43,200 (30 days).
  /// Example: `30`
  final WaitTimer? waitTimer;

  /// Converts an [EnvironmentProtectionRulesInnerAnyOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'type': type,
      'wait_timer': ?waitTimer?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, nodeId, type, waitTimer]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnvironmentProtectionRulesInnerAnyOf0 &&
        id == other.id &&
        nodeId == other.nodeId &&
        type == other.type &&
        waitTimer == other.waitTimer;
  }
}

@immutable
final class EnvironmentProtectionRulesInnerAnyOf1
    extends EnvironmentProtectionRulesInner {
  const EnvironmentProtectionRulesInnerAnyOf1({
    required this.id,
    required this.nodeId,
    required this.type,
    this.preventSelfReview,
    this.reviewers,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EnvironmentProtectionRulesInnerAnyOf1].
  factory EnvironmentProtectionRulesInnerAnyOf1.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'EnvironmentProtectionRulesInnerAnyOf1',
      json,
      () => EnvironmentProtectionRulesInnerAnyOf1(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        preventSelfReview: json['prevent_self_review'] as bool?,
        type: json['type'] as String,
        reviewers: (json['reviewers'] as List?)
            ?.map<EnvironmentProtectionRulesInnerAnyOf1ReviewersInner>(
              (e) =>
                  EnvironmentProtectionRulesInnerAnyOf1ReviewersInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInnerAnyOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInnerAnyOf1.fromJson(json);
  }

  /// Example: `3755`
  final int id;

  /// Example: `'MDQ6R2F0ZTM3NTU='`
  final String nodeId;

  /// Whether deployments to this environment can be approved by the user who
  /// created the deployment.
  /// Example: `false`
  final bool? preventSelfReview;

  /// Example: `'required_reviewers'`
  final String type;

  /// The people or teams that may approve jobs that reference the
  /// environment. You can list up to six users or teams as reviewers. The
  /// reviewers must have at least read access to the repository. Only one of
  /// the required reviewers needs to approve the job for it to proceed.
  final List<EnvironmentProtectionRulesInnerAnyOf1ReviewersInner>? reviewers;

  /// Converts an [EnvironmentProtectionRulesInnerAnyOf1]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'prevent_self_review': ?preventSelfReview,
      'type': type,
      'reviewers': ?reviewers?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    preventSelfReview,
    type,
    listHash(reviewers),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnvironmentProtectionRulesInnerAnyOf1 &&
        id == other.id &&
        nodeId == other.nodeId &&
        preventSelfReview == other.preventSelfReview &&
        type == other.type &&
        listsEqual(reviewers, other.reviewers);
  }
}

@immutable
final class EnvironmentProtectionRulesInnerAnyOf2
    extends EnvironmentProtectionRulesInner {
  const EnvironmentProtectionRulesInnerAnyOf2({
    required this.id,
    required this.nodeId,
    required this.type,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EnvironmentProtectionRulesInnerAnyOf2].
  factory EnvironmentProtectionRulesInnerAnyOf2.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'EnvironmentProtectionRulesInnerAnyOf2',
      json,
      () => EnvironmentProtectionRulesInnerAnyOf2(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInnerAnyOf2? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInnerAnyOf2.fromJson(json);
  }

  /// Example: `3515`
  final int id;

  /// Example: `'MDQ6R2F0ZTM1MTU='`
  final String nodeId;

  /// Example: `'branch_policy'`
  final String type;

  /// Converts an [EnvironmentProtectionRulesInnerAnyOf2]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'node_id': nodeId, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([id, nodeId, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnvironmentProtectionRulesInnerAnyOf2 &&
        id == other.id &&
        nodeId == other.nodeId &&
        type == other.type;
  }
}
