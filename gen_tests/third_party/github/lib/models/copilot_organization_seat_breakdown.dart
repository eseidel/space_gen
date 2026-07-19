import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_organization_seat_breakdown}
/// Copilot Seat Breakdown
/// The breakdown of Copilot Business seats for the organization.
/// {@endtemplate}
@immutable
class CopilotOrganizationSeatBreakdown {
  /// {@macro copilot_organization_seat_breakdown}
  const CopilotOrganizationSeatBreakdown({
    this.total,
    this.addedThisCycle,
    this.pendingCancellation,
    this.pendingInvitation,
    this.activeThisCycle,
    this.inactiveThisCycle,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotOrganizationSeatBreakdown].
  factory CopilotOrganizationSeatBreakdown.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotOrganizationSeatBreakdown',
      json,
      () => CopilotOrganizationSeatBreakdown(
        total: json['total'] as int?,
        addedThisCycle: json['added_this_cycle'] as int?,
        pendingCancellation: json['pending_cancellation'] as int?,
        pendingInvitation: json['pending_invitation'] as int?,
        activeThisCycle: json['active_this_cycle'] as int?,
        inactiveThisCycle: json['inactive_this_cycle'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotOrganizationSeatBreakdown? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotOrganizationSeatBreakdown.fromJson(json);
  }

  /// The total number of seats being billed for the organization as of the
  /// current billing cycle.
  final int? total;

  /// Seats added during the current billing cycle.
  final int? addedThisCycle;

  /// The number of seats that are pending cancellation at the end of the
  /// current billing cycle.
  final int? pendingCancellation;

  /// The number of users who have been invited to receive a Copilot seat
  /// through this organization.
  final int? pendingInvitation;

  /// The number of seats that have used Copilot during the current billing
  /// cycle.
  final int? activeThisCycle;

  /// The number of seats that have not used Copilot during the current
  /// billing cycle.
  final int? inactiveThisCycle;

  /// Converts a [CopilotOrganizationSeatBreakdown] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total': ?total,
      'added_this_cycle': ?addedThisCycle,
      'pending_cancellation': ?pendingCancellation,
      'pending_invitation': ?pendingInvitation,
      'active_this_cycle': ?activeThisCycle,
      'inactive_this_cycle': ?inactiveThisCycle,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    total,
    addedThisCycle,
    pendingCancellation,
    pendingInvitation,
    activeThisCycle,
    inactiveThisCycle,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotOrganizationSeatBreakdown &&
        total == other.total &&
        addedThisCycle == other.addedThisCycle &&
        pendingCancellation == other.pendingCancellation &&
        pendingInvitation == other.pendingInvitation &&
        activeThisCycle == other.activeThisCycle &&
        inactiveThisCycle == other.inactiveThisCycle;
  }
}
