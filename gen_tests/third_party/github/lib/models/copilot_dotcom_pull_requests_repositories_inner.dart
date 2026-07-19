// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_dotcom_pull_requests_repositories_inner_models_inner.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotDotcomPullRequestsRepositoriesInner {
  const CopilotDotcomPullRequestsRepositoriesInner({
    this.name,
    this.totalEngagedUsers,
    this.models,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotDotcomPullRequestsRepositoriesInner].
  factory CopilotDotcomPullRequestsRepositoriesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotDotcomPullRequestsRepositoriesInner',
      json,
      () => CopilotDotcomPullRequestsRepositoriesInner(
        name: json['name'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        models: (json['models'] as List?)
            ?.map<CopilotDotcomPullRequestsRepositoriesInnerModelsInner>(
              (e) =>
                  CopilotDotcomPullRequestsRepositoriesInnerModelsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotDotcomPullRequestsRepositoriesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotDotcomPullRequestsRepositoriesInner.fromJson(json);
  }

  /// Repository name
  final String? name;

  /// The number of users who generated pull request summaries using Copilot
  /// for Pull Requests in the given repository.
  final int? totalEngagedUsers;

  /// List of model metrics for custom models and the default model.
  final List<CopilotDotcomPullRequestsRepositoriesInnerModelsInner>? models;

  /// Converts a [CopilotDotcomPullRequestsRepositoriesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'total_engaged_users': totalEngagedUsers,
      'models': models?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, totalEngagedUsers, listHash(models)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotDotcomPullRequestsRepositoriesInner &&
        name == other.name &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(models, other.models);
  }
}
