import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_code_completions_languages_inner}
/// Usage metrics for a given language for the given editor for Copilot code
/// completions.
/// {@endtemplate}
@immutable
class CopilotIdeCodeCompletionsLanguagesInner {
  /// {@macro copilot_ide_code_completions_languages_inner}
  const CopilotIdeCodeCompletionsLanguagesInner({
    this.name,
    this.totalEngagedUsers,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotIdeCodeCompletionsLanguagesInner].
  factory CopilotIdeCodeCompletionsLanguagesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotIdeCodeCompletionsLanguagesInner',
      json,
      () => CopilotIdeCodeCompletionsLanguagesInner(
        name: json['name'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeCodeCompletionsLanguagesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotIdeCodeCompletionsLanguagesInner.fromJson(json);
  }

  /// Name of the language used for Copilot code completion suggestions.
  final String? name;

  /// Number of users who accepted at least one Copilot code completion
  /// suggestion for the given language. Includes both full and partial
  /// acceptances.
  final int? totalEngagedUsers;

  /// Converts a [CopilotIdeCodeCompletionsLanguagesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'total_engaged_users': ?totalEngagedUsers};
  }

  @override
  int get hashCode => Object.hashAll([name, totalEngagedUsers]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeCodeCompletionsLanguagesInner &&
        name == other.name &&
        totalEngagedUsers == other.totalEngagedUsers;
  }
}
