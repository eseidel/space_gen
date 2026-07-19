// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/commit.dart';
import 'package:github/models/commit_comparison_status.dart';
import 'package:github/models/diff_entry.dart';
import 'package:meta/meta.dart';

/// {@template commit_comparison}
/// Commit Comparison
/// Commit Comparison
/// {@endtemplate}
@immutable
class CommitComparison {
  /// {@macro commit_comparison}
  const CommitComparison({
    required this.url,
    required this.htmlUrl,
    required this.permalinkUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.baseCommit,
    required this.mergeBaseCommit,
    required this.status,
    required this.aheadBy,
    required this.behindBy,
    required this.totalCommits,
    required this.commits,
    this.files,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitComparison].
  factory CommitComparison.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitComparison',
      json,
      () => CommitComparison(
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        permalinkUrl: Uri.parse(json['permalink_url'] as String),
        diffUrl: Uri.parse(json['diff_url'] as String),
        patchUrl: Uri.parse(json['patch_url'] as String),
        baseCommit: Commit.fromJson(
          json['base_commit'] as Map<String, dynamic>,
        ),
        mergeBaseCommit: Commit.fromJson(
          json['merge_base_commit'] as Map<String, dynamic>,
        ),
        status: CommitComparisonStatus.fromJson(json['status'] as String),
        aheadBy: json['ahead_by'] as int,
        behindBy: json['behind_by'] as int,
        totalCommits: json['total_commits'] as int,
        commits: (json['commits'] as List)
            .map<Commit>((e) => Commit.fromJson(e as Map<String, dynamic>))
            .toList(),
        files: (json['files'] as List?)
            ?.map<DiffEntry>(
              (e) => DiffEntry.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitComparison? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitComparison.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/compare/master...topic'`
  final Uri url;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/compare/master...topic'`
  final Uri htmlUrl;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/compare/octocat:bbcd538c8e72b8c175046e27cc8f907076331401...octocat:0328041d1152db8ae77652d1618a02e57f745f17'`
  final Uri permalinkUrl;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/compare/master...topic.diff'`
  final Uri diffUrl;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/compare/master...topic.patch'`
  final Uri patchUrl;

  /// Commit
  /// Commit
  final Commit baseCommit;

  /// Commit
  /// Commit
  final Commit mergeBaseCommit;

  /// Example: `'ahead'`
  final CommitComparisonStatus status;

  /// Example: `4`
  final int aheadBy;

  /// Example: `5`
  final int behindBy;

  /// Example: `6`
  final int totalCommits;
  final List<Commit> commits;
  final List<DiffEntry>? files;

  /// Converts a [CommitComparison] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'permalink_url': permalinkUrl.toString(),
      'diff_url': diffUrl.toString(),
      'patch_url': patchUrl.toString(),
      'base_commit': baseCommit.toJson(),
      'merge_base_commit': mergeBaseCommit.toJson(),
      'status': status.toJson(),
      'ahead_by': aheadBy,
      'behind_by': behindBy,
      'total_commits': totalCommits,
      'commits': commits.map((e) => e.toJson()).toList(),
      'files': ?files?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    htmlUrl,
    permalinkUrl,
    diffUrl,
    patchUrl,
    baseCommit,
    mergeBaseCommit,
    status,
    aheadBy,
    behindBy,
    totalCommits,
    listHash(commits),
    listHash(files),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitComparison &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        permalinkUrl == other.permalinkUrl &&
        diffUrl == other.diffUrl &&
        patchUrl == other.patchUrl &&
        baseCommit == other.baseCommit &&
        mergeBaseCommit == other.mergeBaseCommit &&
        status == other.status &&
        aheadBy == other.aheadBy &&
        behindBy == other.behindBy &&
        totalCommits == other.totalCommits &&
        listsEqual(commits, other.commits) &&
        listsEqual(files, other.files);
  }
}
