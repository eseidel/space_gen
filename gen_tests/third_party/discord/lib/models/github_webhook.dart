import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_check_run.dart';
import 'package:discord/models/github_check_suite.dart';
import 'package:discord/models/github_comment.dart';
import 'package:discord/models/github_commit.dart';
import 'package:discord/models/github_discussion.dart';
import 'package:discord/models/github_issue.dart';
import 'package:discord/models/github_release.dart';
import 'package:discord/models/github_repository.dart';
import 'package:discord/models/github_review.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubWebhook {
  GithubWebhook({
    required this.sender,
    this.action,
    this.ref,
    this.refType,
    this.comment,
    this.issue,
    this.pullRequest,
    this.repository,
    this.forkee,
    this.member,
    this.release,
    this.headCommit,
    this.commits,
    this.forced,
    this.compare,
    this.review,
    this.checkRun,
    this.checkSuite,
    this.discussion,
    this.answer,
  }) {
    action?.validate(maxLength: 152133);
    ref?.validate(maxLength: 152133);
    refType?.validate(maxLength: 152133);
    commits?.validate(maxItems: 1521);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubWebhook].
  factory GithubWebhook.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubWebhook',
      json,
      () => GithubWebhook(
        action: json['action'] as String?,
        ref: json['ref'] as String?,
        refType: json['ref_type'] as String?,
        comment: GithubComment.maybeFromJson(
          json['comment'] as Map<String, dynamic>?,
        ),
        issue: GithubIssue.maybeFromJson(
          json['issue'] as Map<String, dynamic>?,
        ),
        pullRequest: GithubIssue.maybeFromJson(
          json['pull_request'] as Map<String, dynamic>?,
        ),
        repository: GithubRepository.maybeFromJson(
          json['repository'] as Map<String, dynamic>?,
        ),
        forkee: GithubRepository.maybeFromJson(
          json['forkee'] as Map<String, dynamic>?,
        ),
        sender: GithubUser.fromJson(json['sender'] as Map<String, dynamic>),
        member: GithubUser.maybeFromJson(
          json['member'] as Map<String, dynamic>?,
        ),
        release: GithubRelease.maybeFromJson(
          json['release'] as Map<String, dynamic>?,
        ),
        headCommit: GithubCommit.maybeFromJson(
          json['head_commit'] as Map<String, dynamic>?,
        ),
        commits: (json['commits'] as List?)
            ?.map<GithubCommit>(
              (e) => GithubCommit.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        forced: json['forced'] as bool?,
        compare: maybeParseUri(json['compare'] as String?),
        review: GithubReview.maybeFromJson(
          json['review'] as Map<String, dynamic>?,
        ),
        checkRun: GithubCheckRun.maybeFromJson(
          json['check_run'] as Map<String, dynamic>?,
        ),
        checkSuite: GithubCheckSuite.maybeFromJson(
          json['check_suite'] as Map<String, dynamic>?,
        ),
        discussion: GithubDiscussion.maybeFromJson(
          json['discussion'] as Map<String, dynamic>?,
        ),
        answer: GithubComment.maybeFromJson(
          json['answer'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubWebhook? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubWebhook.fromJson(json);
  }

  final String? action;
  final String? ref;
  final String? refType;
  final GithubComment? comment;
  final GithubIssue? issue;
  final GithubIssue? pullRequest;
  final GithubRepository? repository;
  final GithubRepository? forkee;
  final GithubUser sender;
  final GithubUser? member;
  final GithubRelease? release;
  final GithubCommit? headCommit;
  final List<GithubCommit>? commits;
  final bool? forced;
  final Uri? compare;
  final GithubReview? review;
  final GithubCheckRun? checkRun;
  final GithubCheckSuite? checkSuite;
  final GithubDiscussion? discussion;
  final GithubComment? answer;

  /// Converts a [GithubWebhook] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'ref': ref,
      'ref_type': refType,
      'comment': comment?.toJson(),
      'issue': issue?.toJson(),
      'pull_request': pullRequest?.toJson(),
      'repository': repository?.toJson(),
      'forkee': forkee?.toJson(),
      'sender': sender.toJson(),
      'member': member?.toJson(),
      'release': release?.toJson(),
      'head_commit': headCommit?.toJson(),
      'commits': commits?.map((e) => e.toJson()).toList(),
      'forced': forced,
      'compare': compare?.toString(),
      'review': review?.toJson(),
      'check_run': checkRun?.toJson(),
      'check_suite': checkSuite?.toJson(),
      'discussion': discussion?.toJson(),
      'answer': answer?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    action,
    ref,
    refType,
    comment,
    issue,
    pullRequest,
    repository,
    forkee,
    sender,
    member,
    release,
    headCommit,
    listHash(commits),
    forced,
    compare,
    review,
    checkRun,
    checkSuite,
    discussion,
    answer,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubWebhook &&
        action == other.action &&
        ref == other.ref &&
        refType == other.refType &&
        comment == other.comment &&
        issue == other.issue &&
        pullRequest == other.pullRequest &&
        repository == other.repository &&
        forkee == other.forkee &&
        sender == other.sender &&
        member == other.member &&
        release == other.release &&
        headCommit == other.headCommit &&
        listsEqual(commits, other.commits) &&
        forced == other.forced &&
        compare == other.compare &&
        review == other.review &&
        checkRun == other.checkRun &&
        checkSuite == other.checkSuite &&
        discussion == other.discussion &&
        answer == other.answer;
  }
}
