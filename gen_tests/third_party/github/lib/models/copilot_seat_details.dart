import 'package:github/date.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_seat_details_assigning_team.dart';
import 'package:github/models/copilot_seat_details_plan_type.dart';
import 'package:github/models/organization_simple.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template copilot_seat_details}
/// Copilot Business Seat Detail
/// Information about a Copilot Business seat assignment for a user, team, or
/// organization.
/// {@endtemplate}
@immutable
class CopilotSeatDetails {
  /// {@macro copilot_seat_details}
  const CopilotSeatDetails({
    required this.createdAt,
    this.assignee,
    this.organization,
    this.assigningTeam,
    this.pendingCancellationDate,
    this.lastActivityAt,
    this.lastActivityEditor,
    @deprecated this.updatedAt,
    this.planType,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotSeatDetails].
  factory CopilotSeatDetails.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotSeatDetails',
      json,
      () => CopilotSeatDetails(
        assignee: SimpleUser.maybeFromJson(
          json['assignee'] as Map<String, dynamic>?,
        ),
        organization: OrganizationSimple.maybeFromJson(
          json['organization'] as Map<String, dynamic>?,
        ),
        assigningTeam: CopilotSeatDetailsAssigningTeam.maybeFromJson(
          json['assigning_team'] as Map<String, dynamic>?,
        ),
        pendingCancellationDate: Date.maybeFromJson(
          json['pending_cancellation_date'] as String?,
        ),
        lastActivityAt: maybeParseDateTime(json['last_activity_at'] as String?),
        lastActivityEditor: json['last_activity_editor'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
        planType: CopilotSeatDetailsPlanType.maybeFromJson(
          json['plan_type'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotSeatDetails? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotSeatDetails.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? assignee;

  /// Organization Simple
  /// A GitHub organization.
  final OrganizationSimple? organization;

  /// The team through which the assignee is granted access to GitHub Copilot,
  /// if applicable.
  final CopilotSeatDetailsAssigningTeam? assigningTeam;

  /// The pending cancellation date for the seat, in `YYYY-MM-DD` format. This
  /// will be null unless the assignee's Copilot access has been canceled
  /// during the current billing cycle. If the seat has been cancelled, this
  /// corresponds to the start of the organization's next billing cycle.
  final Date? pendingCancellationDate;

  /// Timestamp of user's last GitHub Copilot activity, in ISO 8601 format.
  final DateTime? lastActivityAt;

  /// Last editor that was used by the user for a GitHub Copilot completion.
  final String? lastActivityEditor;

  /// Timestamp of when the assignee was last granted access to GitHub
  /// Copilot, in ISO 8601 format.
  final DateTime createdAt;

  /// **Closing down notice:** This field is no longer relevant and is closing
  /// down. Use the `created_at` field to determine when the assignee was last
  /// granted access to GitHub Copilot. Timestamp of when the assignee's
  /// GitHub Copilot access was last updated, in ISO 8601 format.
  @deprecated
  final DateTime? updatedAt;

  /// The Copilot plan of the organization, or the parent enterprise, when
  /// applicable.
  final CopilotSeatDetailsPlanType? planType;

  /// Converts a [CopilotSeatDetails] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'assignee': assignee?.toJson(),
      'organization': organization?.toJson(),
      'assigning_team': assigningTeam?.toJson(),
      'pending_cancellation_date': pendingCancellationDate?.toJson(),
      'last_activity_at': lastActivityAt?.toIso8601String(),
      'last_activity_editor': lastActivityEditor,
      'created_at': createdAt.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      if (planType != null) 'plan_type': planType?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    assignee,
    organization,
    assigningTeam,
    pendingCancellationDate,
    lastActivityAt,
    lastActivityEditor,
    createdAt,
    updatedAt,
    planType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotSeatDetails &&
        assignee == other.assignee &&
        organization == other.organization &&
        assigningTeam == other.assigningTeam &&
        pendingCancellationDate == other.pendingCancellationDate &&
        lastActivityAt == other.lastActivityAt &&
        lastActivityEditor == other.lastActivityEditor &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        planType == other.planType;
  }
}
