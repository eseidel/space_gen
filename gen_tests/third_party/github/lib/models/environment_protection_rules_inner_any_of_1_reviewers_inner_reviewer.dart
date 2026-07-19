// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

sealed class EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer {
  const EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer();

  factory EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('avatar_url')) {
      return EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerSimpleUser(
        SimpleUser.fromJson(json),
      );
    }
    if (json.containsKey('description')) {
      return EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerTeam(
        Team.fromJson(json),
      );
    }
    throw FormatException(
      'No variant of EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerSimpleUser
    extends EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer {
  const EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerSimpleUser(
    this.value,
  );

  final SimpleUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerSimpleUser &&
        value == other.value;
  }
}

@immutable
final class EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerTeam
    extends EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewer {
  const EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerTeam(
    this.value,
  );

  final Team value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is EnvironmentProtectionRulesInnerAnyOf1ReviewersInnerReviewerTeam &&
        value == other.value;
  }
}
