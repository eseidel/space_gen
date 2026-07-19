import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest {
  const ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest({
    required this.labels,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest].
  factory ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest',
      json,
      () => ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest(
        labels: (json['labels'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest.fromJson(
      json,
    );
  }

  /// The names of the custom labels to add to the runner.
  final List<String> labels;

  /// Converts an [ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'labels': labels};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest &&
        listsEqual(labels, other.labels);
  }
}
