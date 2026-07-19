// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/date.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_dotcom_chat.dart';
import 'package:github/models/copilot_dotcom_pull_requests.dart';
import 'package:github/models/copilot_ide_chat.dart';
import 'package:github/models/copilot_ide_code_completions.dart';
import 'package:meta/meta.dart';

/// {@template copilot_usage_metrics_day}
/// Copilot Usage Metrics
/// Copilot usage metrics for a given day.
/// {@endtemplate}
@immutable
class CopilotUsageMetricsDay {
  /// {@macro copilot_usage_metrics_day}
  const CopilotUsageMetricsDay({
    required this.date,
    required this.entries,
    this.totalActiveUsers,
    this.totalEngagedUsers,
    this.copilotIdeCodeCompletions,
    this.copilotIdeChat,
    this.copilotDotcomChat,
    this.copilotDotcomPullRequests,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotUsageMetricsDay].
  factory CopilotUsageMetricsDay.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotUsageMetricsDay',
      json,
      () => CopilotUsageMetricsDay(
        date: Date.fromJson(json['date'] as String),
        totalActiveUsers: json['total_active_users'] as int?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        copilotIdeCodeCompletions: CopilotIdeCodeCompletions.maybeFromJson(
          json['copilot_ide_code_completions'] as Map<String, dynamic>?,
        ),
        copilotIdeChat: CopilotIdeChat.maybeFromJson(
          json['copilot_ide_chat'] as Map<String, dynamic>?,
        ),
        copilotDotcomChat: CopilotDotcomChat.maybeFromJson(
          json['copilot_dotcom_chat'] as Map<String, dynamic>?,
        ),
        copilotDotcomPullRequests: CopilotDotcomPullRequests.maybeFromJson(
          json['copilot_dotcom_pull_requests'] as Map<String, dynamic>?,
        ),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'date',
              'total_active_users',
              'total_engaged_users',
              'copilot_ide_code_completions',
              'copilot_ide_chat',
              'copilot_dotcom_chat',
              'copilot_dotcom_pull_requests',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotUsageMetricsDay? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotUsageMetricsDay.fromJson(json);
  }

  /// The date for which the usage metrics are aggregated, in `YYYY-MM-DD`
  /// format.
  final Date date;

  /// The total number of Copilot users with activity belonging to any Copilot
  /// feature, globally, for the given day. Includes passive activity such as
  /// receiving a code suggestion, as well as engagement activity such as
  /// accepting a code suggestion or prompting chat. Does not include
  /// authentication events. Is not limited to the individual features
  /// detailed on the endpoint.
  final int? totalActiveUsers;

  /// The total number of Copilot users who engaged with any Copilot feature,
  /// for the given day. Examples include but are not limited to accepting a
  /// code suggestion, prompting Copilot chat, or triggering a PR Summary.
  /// Does not include authentication events. Is not limited to the individual
  /// features detailed on the endpoint.
  final int? totalEngagedUsers;

  /// Usage metrics for Copilot editor code completions in the IDE.
  final CopilotIdeCodeCompletions? copilotIdeCodeCompletions;

  /// Usage metrics for Copilot Chat in the IDE.
  final CopilotIdeChat? copilotIdeChat;

  /// Usage metrics for Copilot Chat in GitHub.com
  final CopilotDotcomChat? copilotDotcomChat;

  /// Usage metrics for Copilot for pull requests.
  final CopilotDotcomPullRequests? copilotDotcomPullRequests;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'date' => date,
    'total_active_users' => totalActiveUsers,
    'total_engaged_users' => totalEngagedUsers,
    'copilot_ide_code_completions' => copilotIdeCodeCompletions,
    'copilot_ide_chat' => copilotIdeChat,
    'copilot_dotcom_chat' => copilotDotcomChat,
    'copilot_dotcom_pull_requests' => copilotDotcomPullRequests,
    _ => entries[key],
  };

  /// Converts a [CopilotUsageMetricsDay] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      if (totalActiveUsers != null) 'total_active_users': totalActiveUsers,
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      'copilot_ide_code_completions': copilotIdeCodeCompletions?.toJson(),
      'copilot_ide_chat': copilotIdeChat?.toJson(),
      'copilot_dotcom_chat': copilotDotcomChat?.toJson(),
      'copilot_dotcom_pull_requests': copilotDotcomPullRequests?.toJson(),
      for (final entry in entries.entries)
        if (!const {
          'date',
          'total_active_users',
          'total_engaged_users',
          'copilot_ide_code_completions',
          'copilot_ide_chat',
          'copilot_dotcom_chat',
          'copilot_dotcom_pull_requests',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    date,
    totalActiveUsers,
    totalEngagedUsers,
    copilotIdeCodeCompletions,
    copilotIdeChat,
    copilotDotcomChat,
    copilotDotcomPullRequests,
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotUsageMetricsDay &&
        date == other.date &&
        totalActiveUsers == other.totalActiveUsers &&
        totalEngagedUsers == other.totalEngagedUsers &&
        copilotIdeCodeCompletions == other.copilotIdeCodeCompletions &&
        copilotIdeChat == other.copilotIdeChat &&
        copilotDotcomChat == other.copilotDotcomChat &&
        copilotDotcomPullRequests == other.copilotDotcomPullRequests &&
        mapsEqual(entries, other.entries);
  }
}
