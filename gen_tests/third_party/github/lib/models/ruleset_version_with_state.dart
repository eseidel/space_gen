import 'package:github/model_helpers.dart';
import 'package:github/models/ruleset_version_actor.dart';
import 'package:meta/meta.dart';

@immutable
class RulesetVersionWithState {
  const RulesetVersionWithState({
    required this.versionId,
    required this.actor,
    required this.updatedAt,
    required this.state,
  });

  /// Converts a `Map<String, dynamic>` to a [RulesetVersionWithState].
  factory RulesetVersionWithState.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RulesetVersionWithState',
      json,
      () => RulesetVersionWithState(
        versionId: json['version_id'] as int,
        actor: RulesetVersionActor.fromJson(
          json['actor'] as Map<String, dynamic>,
        ),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        state: json['state'],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RulesetVersionWithState? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RulesetVersionWithState.fromJson(json);
  }

  /// The ID of the previous version of the ruleset
  final int versionId;

  /// The actor who updated the ruleset
  final RulesetVersionActor actor;
  final DateTime updatedAt;

  /// The state of the ruleset version
  final dynamic state;

  /// Converts a [RulesetVersionWithState] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'version_id': versionId,
      'actor': actor.toJson(),
      'updated_at': updatedAt.toIso8601String(),
      'state': state,
    };
  }

  @override
  int get hashCode => Object.hashAll([versionId, actor, updatedAt, state]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RulesetVersionWithState &&
        versionId == other.versionId &&
        actor == other.actor &&
        updatedAt == other.updatedAt &&
        state == other.state;
  }
}
