import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest {
  const ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest({
    required this.labels,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest].
  factory ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest',
      json,
      () => ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest(
        labels: (json['labels'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.fromJson(
      json,
    );
  }

  /// The names of the custom labels to set for the runner. You can pass an
  /// empty array to remove all custom labels.
  final List<String> labels;

  /// Converts an [ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'labels': labels};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest &&
        listsEqual(labels, other.labels);
  }
}
