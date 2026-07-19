// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_ide_code_completions_editors_inner.dart';
import 'package:github/models/copilot_ide_code_completions_languages_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_code_completions}
/// Usage metrics for Copilot editor code completions in the IDE.
/// {@endtemplate}
@immutable
class CopilotIdeCodeCompletions {
  /// {@macro copilot_ide_code_completions}
  const CopilotIdeCodeCompletions({
    required this.entries,
    this.totalEngagedUsers,
    this.languages,
    this.editors,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotIdeCodeCompletions].
  factory CopilotIdeCodeCompletions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotIdeCodeCompletions',
      json,
      () => CopilotIdeCodeCompletions(
        totalEngagedUsers: json['total_engaged_users'] as int?,
        languages: (json['languages'] as List?)
            ?.map<CopilotIdeCodeCompletionsLanguagesInner>(
              (e) => CopilotIdeCodeCompletionsLanguagesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        editors: (json['editors'] as List?)
            ?.map<CopilotIdeCodeCompletionsEditorsInner>(
              (e) => CopilotIdeCodeCompletionsEditorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'total_engaged_users',
              'languages',
              'editors',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeCodeCompletions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotIdeCodeCompletions.fromJson(json);
  }

  /// Number of users who accepted at least one Copilot code suggestion,
  /// across all active editors. Includes both full and partial acceptances.
  final int? totalEngagedUsers;

  /// Code completion metrics for active languages.
  final List<CopilotIdeCodeCompletionsLanguagesInner>? languages;
  final List<CopilotIdeCodeCompletionsEditorsInner>? editors;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'total_engaged_users' => totalEngagedUsers,
    'languages' => languages,
    'editors' => editors,
    _ => entries[key],
  };

  /// Converts a [CopilotIdeCodeCompletions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      if (languages != null)
        'languages': languages?.map((e) => e.toJson()).toList(),
      if (editors != null) 'editors': editors?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'total_engaged_users',
          'languages',
          'editors',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    totalEngagedUsers,
    listHash(languages),
    listHash(editors),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeCodeCompletions &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(languages, other.languages) &&
        listsEqual(editors, other.editors) &&
        mapsEqual(entries, other.entries);
  }
}
