import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotDotcomPullRequestsRepositoriesInnerModelsInner {
  const CopilotDotcomPullRequestsRepositoriesInnerModelsInner({
    this.name,
    this.isCustomModel,
    this.customModelTrainingDate,
    this.totalPrSummariesCreated,
    this.totalEngagedUsers,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotDotcomPullRequestsRepositoriesInnerModelsInner].
  factory CopilotDotcomPullRequestsRepositoriesInnerModelsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotDotcomPullRequestsRepositoriesInnerModelsInner',
      json,
      () => CopilotDotcomPullRequestsRepositoriesInnerModelsInner(
        name: json['name'] as String?,
        isCustomModel: json['is_custom_model'] as bool?,
        customModelTrainingDate: json['custom_model_training_date'] as String?,
        totalPrSummariesCreated: json['total_pr_summaries_created'] as int?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotDotcomPullRequestsRepositoriesInnerModelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotDotcomPullRequestsRepositoriesInnerModelsInner.fromJson(json);
  }

  /// Name of the model used for Copilot pull request summaries. If the
  /// default model is used will appear as 'default'.
  final String? name;

  /// Indicates whether a model is custom or default.
  final bool? isCustomModel;

  /// The training date for the custom model.
  final String? customModelTrainingDate;

  /// The number of pull request summaries generated using Copilot for Pull
  /// Requests in the given repository.
  final int? totalPrSummariesCreated;

  /// The number of users who generated pull request summaries using Copilot
  /// for Pull Requests in the given repository and model.
  final int? totalEngagedUsers;

  /// Converts a [CopilotDotcomPullRequestsRepositoriesInnerModelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (isCustomModel != null) 'is_custom_model': isCustomModel,
      'custom_model_training_date': customModelTrainingDate,
      if (totalPrSummariesCreated != null)
        'total_pr_summaries_created': totalPrSummariesCreated,
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    isCustomModel,
    customModelTrainingDate,
    totalPrSummariesCreated,
    totalEngagedUsers,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotDotcomPullRequestsRepositoriesInnerModelsInner &&
        name == other.name &&
        isCustomModel == other.isCustomModel &&
        customModelTrainingDate == other.customModelTrainingDate &&
        totalPrSummariesCreated == other.totalPrSummariesCreated &&
        totalEngagedUsers == other.totalEngagedUsers;
  }
}
