import 'package:github/model_helpers.dart';
import 'package:github/models/ruleset_version_actor.dart';
import 'package:meta/meta.dart';

/// {@template ruleset_version}
/// Ruleset version
/// The historical version of a ruleset
/// {@endtemplate}
@immutable
class RulesetVersion {
  /// {@macro ruleset_version}
  const RulesetVersion({
    required this.versionId,
    required this.actor,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [RulesetVersion].
  factory RulesetVersion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RulesetVersion',
      json,
      () => RulesetVersion(
        versionId: json['version_id'] as int,
        actor: RulesetVersionActor.fromJson(
          json['actor'] as Map<String, dynamic>,
        ),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RulesetVersion? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RulesetVersion.fromJson(json);
  }

  /// The ID of the previous version of the ruleset
  final int versionId;

  /// The actor who updated the ruleset
  final RulesetVersionActor actor;
  final DateTime updatedAt;

  /// Converts a [RulesetVersion] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'version_id': versionId,
      'actor': actor.toJson(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([versionId, actor, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RulesetVersion &&
        versionId == other.versionId &&
        actor == other.actor &&
        updatedAt == other.updatedAt;
  }
}
