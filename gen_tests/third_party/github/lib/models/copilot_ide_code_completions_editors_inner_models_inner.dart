// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_ide_code_completions_editors_inner_models_inner_languages_inner.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotIdeCodeCompletionsEditorsInnerModelsInner {
  const CopilotIdeCodeCompletionsEditorsInnerModelsInner({
    this.name,
    this.isCustomModel,
    this.customModelTrainingDate,
    this.totalEngagedUsers,
    this.languages,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotIdeCodeCompletionsEditorsInnerModelsInner].
  factory CopilotIdeCodeCompletionsEditorsInnerModelsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotIdeCodeCompletionsEditorsInnerModelsInner',
      json,
      () => CopilotIdeCodeCompletionsEditorsInnerModelsInner(
        name: json['name'] as String?,
        isCustomModel: json['is_custom_model'] as bool?,
        customModelTrainingDate: json['custom_model_training_date'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        languages: (json['languages'] as List?)
            ?.map<
              CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner
            >(
              (e) =>
                  CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeCodeCompletionsEditorsInnerModelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotIdeCodeCompletionsEditorsInnerModelsInner.fromJson(json);
  }

  /// Name of the model used for Copilot code completion suggestions. If the
  /// default model is used will appear as 'default'.
  final String? name;

  /// Indicates whether a model is custom or default.
  final bool? isCustomModel;

  /// The training date for the custom model.
  final String? customModelTrainingDate;

  /// Number of users who accepted at least one Copilot code completion
  /// suggestion for the given editor, for the given language and model.
  /// Includes both full and partial acceptances.
  final int? totalEngagedUsers;

  /// Code completion metrics for active languages, for the given editor.
  final List<CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner>?
  languages;

  /// Converts a [CopilotIdeCodeCompletionsEditorsInnerModelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (isCustomModel != null) 'is_custom_model': isCustomModel,
      'custom_model_training_date': customModelTrainingDate,
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      if (languages != null)
        'languages': languages?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    isCustomModel,
    customModelTrainingDate,
    totalEngagedUsers,
    listHash(languages),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeCodeCompletionsEditorsInnerModelsInner &&
        name == other.name &&
        isCustomModel == other.isCustomModel &&
        customModelTrainingDate == other.customModelTrainingDate &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(languages, other.languages);
  }
}
