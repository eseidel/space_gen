// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/review_custom_gates_state_required_state.dart';
import 'package:meta/meta.dart';

sealed class ActionsReviewCustomGatesForRunRequest {
  const ActionsReviewCustomGatesForRunRequest();

  factory ActionsReviewCustomGatesForRunRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('comment')) {
      return ReviewCustomGatesCommentRequired.fromJson(json);
    }
    if (json.containsKey('state')) {
      return ReviewCustomGatesStateRequired.fromJson(json);
    }
    throw FormatException(
      'No variant of ActionsReviewCustomGatesForRunRequest matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsReviewCustomGatesForRunRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsReviewCustomGatesForRunRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ReviewCustomGatesCommentRequired
    extends ActionsReviewCustomGatesForRunRequest {
  const ReviewCustomGatesCommentRequired({
    required this.environmentName,
    required this.comment,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewCustomGatesCommentRequired].
  factory ReviewCustomGatesCommentRequired.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewCustomGatesCommentRequired',
      json,
      () => ReviewCustomGatesCommentRequired(
        environmentName: json['environment_name'] as String,
        comment: json['comment'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewCustomGatesCommentRequired? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReviewCustomGatesCommentRequired.fromJson(json);
  }

  /// The name of the environment to approve or reject.
  final String environmentName;

  /// Comment associated with the pending deployment protection rule.
  /// **Required when state is not provided.**
  final String comment;

  /// Converts a [ReviewCustomGatesCommentRequired] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'environment_name': environmentName, 'comment': comment};
  }

  @override
  int get hashCode => Object.hashAll([environmentName, comment]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewCustomGatesCommentRequired &&
        environmentName == other.environmentName &&
        comment == other.comment;
  }
}

@immutable
final class ReviewCustomGatesStateRequired
    extends ActionsReviewCustomGatesForRunRequest {
  const ReviewCustomGatesStateRequired({
    required this.environmentName,
    required this.state,
    this.comment,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewCustomGatesStateRequired].
  factory ReviewCustomGatesStateRequired.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewCustomGatesStateRequired',
      json,
      () => ReviewCustomGatesStateRequired(
        environmentName: json['environment_name'] as String,
        state: ReviewCustomGatesStateRequiredState.fromJson(
          json['state'] as String,
        ),
        comment: json['comment'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewCustomGatesStateRequired? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReviewCustomGatesStateRequired.fromJson(json);
  }

  /// The name of the environment to approve or reject.
  final String environmentName;

  /// Whether to approve or reject deployment to the specified environments.
  final ReviewCustomGatesStateRequiredState state;

  /// Optional comment to include with the review.
  final String? comment;

  /// Converts a [ReviewCustomGatesStateRequired] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'environment_name': environmentName,
      'state': state.toJson(),
      if (comment != null) 'comment': comment,
    };
  }

  @override
  int get hashCode => Object.hashAll([environmentName, state, comment]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewCustomGatesStateRequired &&
        environmentName == other.environmentName &&
        state == other.state &&
        comment == other.comment;
  }
}
