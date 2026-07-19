import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_review_request}
/// Pull Request Review Request
/// Pull Request Review Request
/// {@endtemplate}
@immutable
class PullRequestReviewRequest {
  /// {@macro pull_request_review_request}
  const PullRequestReviewRequest({required this.users, required this.teams});

  /// Converts a `Map<String, dynamic>` to a [PullRequestReviewRequest].
  factory PullRequestReviewRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReviewRequest',
      json,
      () => PullRequestReviewRequest(
        users: (json['users'] as List)
            .map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        teams: (json['teams'] as List)
            .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewRequest.fromJson(json);
  }

  final List<SimpleUser> users;
  final List<Team> teams;

  /// Converts a [PullRequestReviewRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'users': users.map((e) => e.toJson()).toList(),
      'teams': teams.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(users), listHash(teams)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewRequest &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams);
  }
}
