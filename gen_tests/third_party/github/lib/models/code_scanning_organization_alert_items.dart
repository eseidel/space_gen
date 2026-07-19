import 'package:github/model_helpers.dart';
import 'package:github/models/alert_created_at.dart';
import 'package:github/models/alert_dismissed_at.dart';
import 'package:github/models/alert_fixed_at.dart';
import 'package:github/models/alert_html_url.dart';
import 'package:github/models/alert_instances_url.dart';
import 'package:github/models/alert_number.dart';
import 'package:github/models/alert_updated_at.dart';
import 'package:github/models/alert_url.dart';
import 'package:github/models/code_scanning_alert_dismissed_comment.dart';
import 'package:github/models/code_scanning_alert_dismissed_reason.dart';
import 'package:github/models/code_scanning_alert_instance.dart';
import 'package:github/models/code_scanning_alert_rule_summary.dart';
import 'package:github/models/code_scanning_alert_state.dart';
import 'package:github/models/code_scanning_analysis_tool.dart';
import 'package:github/models/simple_repository.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningOrganizationAlertItems {
  const CodeScanningOrganizationAlertItems({
    required this.number,
    required this.createdAt,
    required this.url,
    required this.htmlUrl,
    required this.instancesUrl,
    required this.state,
    required this.dismissedBy,
    required this.dismissedAt,
    required this.dismissedReason,
    required this.rule,
    required this.tool,
    required this.mostRecentInstance,
    required this.repository,
    this.updatedAt,
    this.fixedAt,
    this.dismissedComment,
    this.dismissalApprovedBy,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningOrganizationAlertItems].
  factory CodeScanningOrganizationAlertItems.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningOrganizationAlertItems',
      json,
      () => CodeScanningOrganizationAlertItems(
        number: AlertNumber.fromJson(json['number'] as int),
        createdAt: AlertCreatedAt.fromJson(json['created_at'] as String),
        updatedAt: AlertUpdatedAt.maybeFromJson(json['updated_at'] as String?),
        url: AlertUrl.fromJson(json['url'] as String),
        htmlUrl: AlertHtmlUrl.fromJson(json['html_url'] as String),
        instancesUrl: AlertInstancesUrl.fromJson(
          json['instances_url'] as String,
        ),
        state: CodeScanningAlertState.maybeFromJson(
          checkedKey(json, 'state') as String?,
        ),
        fixedAt: AlertFixedAt.maybeFromJson(json['fixed_at'] as String?),
        dismissedBy: SimpleUser.maybeFromJson(
          checkedKey(json, 'dismissed_by') as Map<String, dynamic>?,
        ),
        dismissedAt: AlertDismissedAt.maybeFromJson(
          checkedKey(json, 'dismissed_at') as String?,
        ),
        dismissedReason: CodeScanningAlertDismissedReason.maybeFromJson(
          checkedKey(json, 'dismissed_reason') as String?,
        ),
        dismissedComment: CodeScanningAlertDismissedComment.maybeFromJson(
          json['dismissed_comment'] as String?,
        ),
        rule: CodeScanningAlertRuleSummary.fromJson(
          json['rule'] as Map<String, dynamic>,
        ),
        tool: CodeScanningAnalysisTool.fromJson(
          json['tool'] as Map<String, dynamic>,
        ),
        mostRecentInstance: CodeScanningAlertInstance.fromJson(
          json['most_recent_instance'] as Map<String, dynamic>,
        ),
        repository: SimpleRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        dismissalApprovedBy: SimpleUser.maybeFromJson(
          json['dismissal_approved_by'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningOrganizationAlertItems? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningOrganizationAlertItems.fromJson(json);
  }

  /// The security alert number.
  final AlertNumber number;

  /// The time that the alert was created in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertCreatedAt createdAt;

  /// The time that the alert was last updated in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertUpdatedAt? updatedAt;

  /// The REST API URL of the alert resource.
  final AlertUrl url;

  /// The GitHub URL of the alert resource.
  final AlertHtmlUrl htmlUrl;

  /// The REST API URL for fetching the list of instances for an alert.
  final AlertInstancesUrl instancesUrl;

  /// State of a code scanning alert.
  final CodeScanningAlertState? state;

  /// The time that the alert was no longer detected and was considered fixed
  /// in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertFixedAt? fixedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? dismissedBy;

  /// The time that the alert was dismissed in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertDismissedAt? dismissedAt;

  /// **Required when the state is dismissed.** The reason for dismissing or
  /// closing the alert.
  final CodeScanningAlertDismissedReason? dismissedReason;

  /// The dismissal comment associated with the dismissal of the alert.
  final CodeScanningAlertDismissedComment? dismissedComment;
  final CodeScanningAlertRuleSummary rule;
  final CodeScanningAnalysisTool tool;
  final CodeScanningAlertInstance mostRecentInstance;

  /// Simple Repository
  /// A GitHub repository.
  final SimpleRepository repository;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? dismissalApprovedBy;

  /// Converts a [CodeScanningOrganizationAlertItems]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'number': number.toJson(),
      'created_at': createdAt.toJson(),
      'updated_at': ?updatedAt?.toJson(),
      'url': url.toJson(),
      'html_url': htmlUrl.toJson(),
      'instances_url': instancesUrl.toJson(),
      'state': state?.toJson(),
      'fixed_at': fixedAt?.toJson(),
      'dismissed_by': dismissedBy?.toJson(),
      'dismissed_at': dismissedAt?.toJson(),
      'dismissed_reason': dismissedReason?.toJson(),
      'dismissed_comment': dismissedComment?.toJson(),
      'rule': rule.toJson(),
      'tool': tool.toJson(),
      'most_recent_instance': mostRecentInstance.toJson(),
      'repository': repository.toJson(),
      'dismissal_approved_by': dismissalApprovedBy?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    number,
    createdAt,
    updatedAt,
    url,
    htmlUrl,
    instancesUrl,
    state,
    fixedAt,
    dismissedBy,
    dismissedAt,
    dismissedReason,
    dismissedComment,
    rule,
    tool,
    mostRecentInstance,
    repository,
    dismissalApprovedBy,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningOrganizationAlertItems &&
        number == other.number &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        instancesUrl == other.instancesUrl &&
        state == other.state &&
        fixedAt == other.fixedAt &&
        dismissedBy == other.dismissedBy &&
        dismissedAt == other.dismissedAt &&
        dismissedReason == other.dismissedReason &&
        dismissedComment == other.dismissedComment &&
        rule == other.rule &&
        tool == other.tool &&
        mostRecentInstance == other.mostRecentInstance &&
        repository == other.repository &&
        dismissalApprovedBy == other.dismissalApprovedBy;
  }
}
