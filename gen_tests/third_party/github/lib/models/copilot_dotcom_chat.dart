// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_dotcom_chat_models_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_dotcom_chat}
/// Usage metrics for Copilot Chat in GitHub.com
/// {@endtemplate}
@immutable
class CopilotDotcomChat {
  /// {@macro copilot_dotcom_chat}
  const CopilotDotcomChat({
    required this.entries,
    this.totalEngagedUsers,
    this.models,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotDotcomChat].
  factory CopilotDotcomChat.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotDotcomChat',
      json,
      () => CopilotDotcomChat(
        totalEngagedUsers: json['total_engaged_users'] as int?,
        models: (json['models'] as List?)
            ?.map<CopilotDotcomChatModelsInner>(
              (e) => CopilotDotcomChatModelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {'total_engaged_users', 'models'}.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotDotcomChat? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotDotcomChat.fromJson(json);
  }

  /// Total number of users who prompted Copilot Chat on github.com at least
  /// once.
  final int? totalEngagedUsers;

  /// List of model metrics for a custom models and the default model.
  final List<CopilotDotcomChatModelsInner>? models;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'total_engaged_users' => totalEngagedUsers,
    'models' => models,
    _ => entries[key],
  };

  /// Converts a [CopilotDotcomChat] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_engaged_users': totalEngagedUsers,
      'models': models?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {'total_engaged_users', 'models'}.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalEngagedUsers, listHash(models), mapHash(entries)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotDotcomChat &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(models, other.models) &&
        mapsEqual(entries, other.entries);
  }
}
