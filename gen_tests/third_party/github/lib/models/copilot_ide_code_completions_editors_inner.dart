// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_ide_code_completions_editors_inner_models_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_code_completions_editors_inner}
/// Copilot code completion metrics for active editors.
/// {@endtemplate}
@immutable
class CopilotIdeCodeCompletionsEditorsInner {
  /// {@macro copilot_ide_code_completions_editors_inner}
  const CopilotIdeCodeCompletionsEditorsInner({
    required this.entries,
    this.name,
    this.totalEngagedUsers,
    this.models,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotIdeCodeCompletionsEditorsInner].
  factory CopilotIdeCodeCompletionsEditorsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotIdeCodeCompletionsEditorsInner',
      json,
      () => CopilotIdeCodeCompletionsEditorsInner(
        name: json['name'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        models: (json['models'] as List?)
            ?.map<CopilotIdeCodeCompletionsEditorsInnerModelsInner>(
              (e) => CopilotIdeCodeCompletionsEditorsInnerModelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'name',
              'total_engaged_users',
              'models',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeCodeCompletionsEditorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotIdeCodeCompletionsEditorsInner.fromJson(json);
  }

  /// Name of the given editor.
  final String? name;

  /// Number of users who accepted at least one Copilot code completion
  /// suggestion for the given editor. Includes both full and partial
  /// acceptances.
  final int? totalEngagedUsers;

  /// List of model metrics for custom models and the default model.
  final List<CopilotIdeCodeCompletionsEditorsInnerModelsInner>? models;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'total_engaged_users' => totalEngagedUsers,
    'models' => models,
    _ => entries[key],
  };

  /// Converts a [CopilotIdeCodeCompletionsEditorsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'total_engaged_users': ?totalEngagedUsers,
      'models': ?models?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'name',
          'total_engaged_users',
          'models',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    totalEngagedUsers,
    listHash(models),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeCodeCompletionsEditorsInner &&
        name == other.name &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(models, other.models) &&
        mapsEqual(entries, other.entries);
  }
}
