// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest {
  ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest({
    required this.labels,
  }) {
    labels.validate(minItems: 1, maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest].
  factory ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest',
      json,
      () => ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest(
        labels: (json['labels'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.fromJson(json);
  }

  /// The names of the custom labels to add to the runner.
  final List<String> labels;

  /// Converts an [ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'labels': labels};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest &&
        listsEqual(labels, other.labels);
  }
}
