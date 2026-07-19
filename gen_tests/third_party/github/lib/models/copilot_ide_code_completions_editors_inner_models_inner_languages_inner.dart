// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_code_completions_editors_inner_models_inner_languages_inner}
/// Usage metrics for a given language for the given editor for Copilot code
/// completions.
/// {@endtemplate}
@immutable
class CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner {
  /// {@macro copilot_ide_code_completions_editors_inner_models_inner_languages_inner}
  const CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner({
    this.name,
    this.totalEngagedUsers,
    this.totalCodeSuggestions,
    this.totalCodeAcceptances,
    this.totalCodeLinesSuggested,
    this.totalCodeLinesAccepted,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner].
  factory CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner',
      json,
      () => CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner(
        name: json['name'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        totalCodeSuggestions: json['total_code_suggestions'] as int?,
        totalCodeAcceptances: json['total_code_acceptances'] as int?,
        totalCodeLinesSuggested: json['total_code_lines_suggested'] as int?,
        totalCodeLinesAccepted: json['total_code_lines_accepted'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner.fromJson(
      json,
    );
  }

  /// Name of the language used for Copilot code completion suggestions, for
  /// the given editor.
  final String? name;

  /// Number of users who accepted at least one Copilot code completion
  /// suggestion for the given editor, for the given language. Includes both
  /// full and partial acceptances.
  final int? totalEngagedUsers;

  /// The number of Copilot code suggestions generated for the given editor,
  /// for the given language.
  final int? totalCodeSuggestions;

  /// The number of Copilot code suggestions accepted for the given editor,
  /// for the given language. Includes both full and partial acceptances.
  final int? totalCodeAcceptances;

  /// The number of lines of code suggested by Copilot code completions for
  /// the given editor, for the given language.
  final int? totalCodeLinesSuggested;

  /// The number of lines of code accepted from Copilot code suggestions for
  /// the given editor, for the given language.
  final int? totalCodeLinesAccepted;

  /// Converts a [CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      if (totalCodeSuggestions != null)
        'total_code_suggestions': totalCodeSuggestions,
      if (totalCodeAcceptances != null)
        'total_code_acceptances': totalCodeAcceptances,
      if (totalCodeLinesSuggested != null)
        'total_code_lines_suggested': totalCodeLinesSuggested,
      if (totalCodeLinesAccepted != null)
        'total_code_lines_accepted': totalCodeLinesAccepted,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    totalEngagedUsers,
    totalCodeSuggestions,
    totalCodeAcceptances,
    totalCodeLinesSuggested,
    totalCodeLinesAccepted,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CopilotIdeCodeCompletionsEditorsInnerModelsInnerLanguagesInner &&
        name == other.name &&
        totalEngagedUsers == other.totalEngagedUsers &&
        totalCodeSuggestions == other.totalCodeSuggestions &&
        totalCodeAcceptances == other.totalCodeAcceptances &&
        totalCodeLinesSuggested == other.totalCodeLinesSuggested &&
        totalCodeLinesAccepted == other.totalCodeLinesAccepted;
  }
}
