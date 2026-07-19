import 'package:github/model_helpers.dart';
import 'package:github/models/milestone_state.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template milestone}
/// Milestone
/// A collection of related issues and pull requests.
/// {@endtemplate}
@immutable
class Milestone {
  /// {@macro milestone}
  const Milestone({
    required this.url,
    required this.htmlUrl,
    required this.labelsUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.description,
    required this.creator,
    required this.openIssues,
    required this.closedIssues,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.dueOn,
    this.state = MilestoneState.open,
  });

  /// Converts a `Map<String, dynamic>` to a [Milestone].
  factory Milestone.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Milestone',
      json,
      () => Milestone(
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        labelsUrl: Uri.parse(json['labels_url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        number: json['number'] as int,
        state: MilestoneState.fromJson(json['state'] as String),
        title: json['title'] as String,
        description: checkedKey(json, 'description') as String?,
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
        openIssues: json['open_issues'] as int,
        closedIssues: json['closed_issues'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        closedAt: maybeParseDateTime(checkedKey(json, 'closed_at') as String?),
        dueOn: maybeParseDateTime(checkedKey(json, 'due_on') as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Milestone? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Milestone.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/milestones/1'`
  final Uri url;

  /// Example: `'https://github.com/octocat/Hello-World/milestones/v1.0'`
  final Uri htmlUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/milestones/1/labels'`
  final Uri labelsUrl;

  /// Example: `1002604`
  final int id;

  /// Example: `'MDk6TWlsZXN0b25lMTAwMjYwNA=='`
  final String nodeId;

  /// The number of the milestone.
  /// Example: `42`
  final int number;

  /// The state of the milestone.
  /// Example: `'open'`
  final MilestoneState state;

  /// The title of the milestone.
  /// Example: `'v1.0'`
  final String title;

  /// Example: `'Tracking milestone for version 1.0'`
  final String? description;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

  /// Example: `4`
  final int openIssues;

  /// Example: `8`
  final int closedIssues;

  /// Example: `'2011-04-10T20:09:31Z'`
  final DateTime createdAt;

  /// Example: `'2014-03-03T18:58:10Z'`
  final DateTime updatedAt;

  /// Example: `'2013-02-12T13:22:01Z'`
  final DateTime? closedAt;

  /// Example: `'2012-10-09T23:39:01Z'`
  final DateTime? dueOn;

  /// Converts a [Milestone] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'labels_url': labelsUrl.toString(),
      'id': id,
      'node_id': nodeId,
      'number': number,
      'state': state.toJson(),
      'title': title,
      'description': description,
      'creator': creator?.toJson(),
      'open_issues': openIssues,
      'closed_issues': closedIssues,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'closed_at': closedAt?.toIso8601String(),
      'due_on': dueOn?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    htmlUrl,
    labelsUrl,
    id,
    nodeId,
    number,
    state,
    title,
    description,
    creator,
    openIssues,
    closedIssues,
    createdAt,
    updatedAt,
    closedAt,
    dueOn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Milestone &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        labelsUrl == other.labelsUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        number == other.number &&
        state == other.state &&
        title == other.title &&
        description == other.description &&
        creator == other.creator &&
        openIssues == other.openIssues &&
        closedIssues == other.closedIssues &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        closedAt == other.closedAt &&
        dueOn == other.dueOn;
  }
}
