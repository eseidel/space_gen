// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

sealed class PendingDeploymentReviewersInnerReviewer {
  const PendingDeploymentReviewersInnerReviewer();

  factory PendingDeploymentReviewersInnerReviewer.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('avatar_url')) {
      return PendingDeploymentReviewersInnerReviewerSimpleUser(
        SimpleUser.fromJson(json),
      );
    }
    if (json.containsKey('description')) {
      return PendingDeploymentReviewersInnerReviewerTeam(Team.fromJson(json));
    }
    throw FormatException(
      'No variant of PendingDeploymentReviewersInnerReviewer matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PendingDeploymentReviewersInnerReviewer? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PendingDeploymentReviewersInnerReviewer.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class PendingDeploymentReviewersInnerReviewerSimpleUser
    extends PendingDeploymentReviewersInnerReviewer {
  const PendingDeploymentReviewersInnerReviewerSimpleUser(this.value);

  final SimpleUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PendingDeploymentReviewersInnerReviewerSimpleUser &&
        value == other.value;
  }
}

@immutable
final class PendingDeploymentReviewersInnerReviewerTeam
    extends PendingDeploymentReviewersInnerReviewer {
  const PendingDeploymentReviewersInnerReviewerTeam(this.value);

  final Team value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PendingDeploymentReviewersInnerReviewerTeam &&
        value == other.value;
  }
}
