import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_reviewer_type.dart';
import 'package:github/models/pending_deployment_reviewers_inner_reviewer.dart';
import 'package:meta/meta.dart';

@immutable
class PendingDeploymentReviewersInner {
  const PendingDeploymentReviewersInner({this.type, this.reviewer});

  /// Converts a `Map<String, dynamic>` to a [PendingDeploymentReviewersInner].
  factory PendingDeploymentReviewersInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PendingDeploymentReviewersInner',
      json,
      () => PendingDeploymentReviewersInner(
        type: DeploymentReviewerType.maybeFromJson(json['type'] as String?),
        reviewer: PendingDeploymentReviewersInnerReviewer.maybeFromJson(
          json['reviewer'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PendingDeploymentReviewersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PendingDeploymentReviewersInner.fromJson(json);
  }

  /// The type of reviewer.
  /// Example: `'User'`
  final DeploymentReviewerType? type;
  final PendingDeploymentReviewersInnerReviewer? reviewer;

  /// Converts a [PendingDeploymentReviewersInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': ?type?.toJson(), 'reviewer': ?reviewer?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, reviewer]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PendingDeploymentReviewersInner &&
        type == other.type &&
        reviewer == other.reviewer;
  }
}
