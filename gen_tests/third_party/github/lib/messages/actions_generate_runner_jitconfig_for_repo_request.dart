import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGenerateRunnerJitconfigForRepoRequest {
  ActionsGenerateRunnerJitconfigForRepoRequest({
    required this.name,
    required this.runnerGroupId,
    required this.labels,
    this.workFolder = '_work',
  }) {
    labels.validate(minItems: 1, maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGenerateRunnerJitconfigForRepoRequest].
  factory ActionsGenerateRunnerJitconfigForRepoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGenerateRunnerJitconfigForRepoRequest',
      json,
      () => ActionsGenerateRunnerJitconfigForRepoRequest(
        name: json['name'] as String,
        runnerGroupId: json['runner_group_id'] as int,
        labels: (json['labels'] as List).cast<String>(),
        workFolder: (json['work_folder'] as String?) ?? '_work',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGenerateRunnerJitconfigForRepoRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGenerateRunnerJitconfigForRepoRequest.fromJson(json);
  }

  /// The name of the new runner.
  final String name;

  /// The ID of the runner group to register the runner to.
  final int runnerGroupId;

  /// The names of the custom labels to add to the runner. **Minimum items**:
  /// 1. **Maximum items**: 100.
  final List<String> labels;

  /// The working directory to be used for job execution, relative to the
  /// runner install directory.
  final String workFolder;

  /// Converts an [ActionsGenerateRunnerJitconfigForRepoRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'runner_group_id': runnerGroupId,
      'labels': labels,
      'work_folder': workFolder,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, runnerGroupId, listHash(labels), workFolder]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGenerateRunnerJitconfigForRepoRequest &&
        name == other.name &&
        runnerGroupId == other.runnerGroupId &&
        listsEqual(labels, other.labels) &&
        workFolder == other.workFolder;
  }
}
