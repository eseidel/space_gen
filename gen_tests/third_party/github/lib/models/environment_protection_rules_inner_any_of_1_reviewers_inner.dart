// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_reviewer_type.dart';
import 'package:github/models/environment_protection_rules_inner_any_of_1_reviewers_inner_reviewer.dart';
import 'package:meta/meta.dart';

@immutable
class EnvironmentProtectionRulesInnerAnyOf1ReviewersInner {
  const EnvironmentProtectionRulesInnerAnyOf1ReviewersInner({
    this.type,
    this.reviewer,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EnvironmentProtectionRulesInnerAnyOf1ReviewersInner].
  factory EnvironmentProtectionRulesInnerAnyOf1ReviewersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'EnvironmentProtectionRulesInnerAnyOf1ReviewersInner',
      json,
      () => EnvironmentProtectionRulesInnerAnyOf1ReviewersInner(
        type: DeploymentReviewerType.maybeFromJson(json['type'] as String?),
        reviewer:
            EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer.maybeFromJson(
              json['reviewer'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInnerAnyOf1ReviewersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInnerAnyOf1ReviewersInner.fromJson(json);
  }

  /// The type of reviewer.
  /// Example: `'User'`
  final DeploymentReviewerType? type;
  final EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer? reviewer;

  /// Converts an [EnvironmentProtectionRulesInnerAnyOf1ReviewersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type?.toJson(), 'reviewer': reviewer?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, reviewer]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnvironmentProtectionRulesInnerAnyOf1ReviewersInner &&
        type == other.type &&
        reviewer == other.reviewer;
  }
}
