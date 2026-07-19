// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_ide_chat_editors_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_chat}
/// Usage metrics for Copilot Chat in the IDE.
/// {@endtemplate}
@immutable
class CopilotIdeChat {
  /// {@macro copilot_ide_chat}
  const CopilotIdeChat({
    required this.entries,
    this.totalEngagedUsers,
    this.editors,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotIdeChat].
  factory CopilotIdeChat.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotIdeChat',
      json,
      () => CopilotIdeChat(
        totalEngagedUsers: json['total_engaged_users'] as int?,
        editors: (json['editors'] as List?)
            ?.map<CopilotIdeChatEditorsInner>(
              (e) => CopilotIdeChatEditorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {'total_engaged_users', 'editors'}.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeChat? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotIdeChat.fromJson(json);
  }

  /// Total number of users who prompted Copilot Chat in the IDE.
  final int? totalEngagedUsers;
  final List<CopilotIdeChatEditorsInner>? editors;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'total_engaged_users' => totalEngagedUsers,
    'editors' => editors,
    _ => entries[key],
  };

  /// Converts a [CopilotIdeChat] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_engaged_users': totalEngagedUsers,
      'editors': editors?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {'total_engaged_users', 'editors'}.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalEngagedUsers, listHash(editors), mapHash(entries)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeChat &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(editors, other.editors) &&
        mapsEqual(entries, other.entries);
  }
}
