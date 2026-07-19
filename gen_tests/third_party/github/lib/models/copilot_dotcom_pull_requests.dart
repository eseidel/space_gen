// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_dotcom_pull_requests_repositories_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_dotcom_pull_requests}
/// Usage metrics for Copilot for pull requests.
/// {@endtemplate}
@immutable
class CopilotDotcomPullRequests {
  /// {@macro copilot_dotcom_pull_requests}
  const CopilotDotcomPullRequests({
    required this.entries,
    this.totalEngagedUsers,
    this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotDotcomPullRequests].
  factory CopilotDotcomPullRequests.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotDotcomPullRequests',
      json,
      () => CopilotDotcomPullRequests(
        totalEngagedUsers: json['total_engaged_users'] as int?,
        repositories: (json['repositories'] as List?)
            ?.map<CopilotDotcomPullRequestsRepositoriesInner>(
              (e) => CopilotDotcomPullRequestsRepositoriesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'total_engaged_users',
              'repositories',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotDotcomPullRequests? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotDotcomPullRequests.fromJson(json);
  }

  /// The number of users who used Copilot for Pull Requests on github.com to
  /// generate a pull request summary at least once.
  final int? totalEngagedUsers;

  /// Repositories in which users used Copilot for Pull Requests to generate
  /// pull request summaries
  final List<CopilotDotcomPullRequestsRepositoriesInner>? repositories;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'total_engaged_users' => totalEngagedUsers,
    'repositories' => repositories,
    _ => entries[key],
  };

  /// Converts a [CopilotDotcomPullRequests] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      if (repositories != null)
        'repositories': repositories?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {'total_engaged_users', 'repositories'}.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    totalEngagedUsers,
    listHash(repositories),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotDotcomPullRequests &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(repositories, other.repositories) &&
        mapsEqual(entries, other.entries);
  }
}
