// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_organization_details_cli.dart';
import 'package:github/models/copilot_organization_details_ide_chat.dart';
import 'package:github/models/copilot_organization_details_plan_type.dart';
import 'package:github/models/copilot_organization_details_platform_chat.dart';
import 'package:github/models/copilot_organization_details_public_code_suggestions.dart';
import 'package:github/models/copilot_organization_details_seat_management_setting.dart';
import 'package:github/models/copilot_organization_seat_breakdown.dart';
import 'package:meta/meta.dart';

/// {@template copilot_organization_details}
/// Copilot Organization Details
/// Information about the seat breakdown and policies set for an organization
/// with a Copilot Business or Copilot Enterprise subscription.
/// {@endtemplate}
@immutable
class CopilotOrganizationDetails {
  /// {@macro copilot_organization_details}
  const CopilotOrganizationDetails({
    required this.seatBreakdown,
    required this.publicCodeSuggestions,
    required this.seatManagementSetting,
    required this.entries,
    this.ideChat,
    this.platformChat,
    this.cli,
    this.planType,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotOrganizationDetails].
  factory CopilotOrganizationDetails.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotOrganizationDetails',
      json,
      () => CopilotOrganizationDetails(
        seatBreakdown: CopilotOrganizationSeatBreakdown.fromJson(
          json['seat_breakdown'] as Map<String, dynamic>,
        ),
        publicCodeSuggestions:
            CopilotOrganizationDetailsPublicCodeSuggestions.fromJson(
              json['public_code_suggestions'] as String,
            ),
        ideChat: CopilotOrganizationDetailsIdeChat.maybeFromJson(
          json['ide_chat'] as String?,
        ),
        platformChat: CopilotOrganizationDetailsPlatformChat.maybeFromJson(
          json['platform_chat'] as String?,
        ),
        cli: CopilotOrganizationDetailsCli.maybeFromJson(
          json['cli'] as String?,
        ),
        seatManagementSetting:
            CopilotOrganizationDetailsSeatManagementSetting.fromJson(
              json['seat_management_setting'] as String,
            ),
        planType: CopilotOrganizationDetailsPlanType.maybeFromJson(
          json['plan_type'] as String?,
        ),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'seat_breakdown',
              'public_code_suggestions',
              'ide_chat',
              'platform_chat',
              'cli',
              'seat_management_setting',
              'plan_type',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotOrganizationDetails? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotOrganizationDetails.fromJson(json);
  }

  /// Copilot Seat Breakdown
  /// The breakdown of Copilot Business seats for the organization.
  final CopilotOrganizationSeatBreakdown seatBreakdown;

  /// The organization policy for allowing or blocking suggestions matching
  /// public code (duplication detection filter).
  final CopilotOrganizationDetailsPublicCodeSuggestions publicCodeSuggestions;

  /// The organization policy for allowing or disallowing Copilot Chat in the
  /// IDE.
  final CopilotOrganizationDetailsIdeChat? ideChat;

  /// The organization policy for allowing or disallowing Copilot features on
  /// GitHub.com.
  final CopilotOrganizationDetailsPlatformChat? platformChat;

  /// The organization policy for allowing or disallowing Copilot in the CLI.
  final CopilotOrganizationDetailsCli? cli;

  /// The mode of assigning new seats.
  final CopilotOrganizationDetailsSeatManagementSetting seatManagementSetting;

  /// The Copilot plan of the organization, or the parent enterprise, when
  /// applicable.
  final CopilotOrganizationDetailsPlanType? planType;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'seat_breakdown' => seatBreakdown,
    'public_code_suggestions' => publicCodeSuggestions,
    'ide_chat' => ideChat,
    'platform_chat' => platformChat,
    'cli' => cli,
    'seat_management_setting' => seatManagementSetting,
    'plan_type' => planType,
    _ => entries[key],
  };

  /// Converts a [CopilotOrganizationDetails] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'seat_breakdown': seatBreakdown.toJson(),
      'public_code_suggestions': publicCodeSuggestions.toJson(),
      if (ideChat != null) 'ide_chat': ideChat?.toJson(),
      if (platformChat != null) 'platform_chat': platformChat?.toJson(),
      if (cli != null) 'cli': cli?.toJson(),
      'seat_management_setting': seatManagementSetting.toJson(),
      if (planType != null) 'plan_type': planType?.toJson(),
      for (final entry in entries.entries)
        if (!const {
          'seat_breakdown',
          'public_code_suggestions',
          'ide_chat',
          'platform_chat',
          'cli',
          'seat_management_setting',
          'plan_type',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    seatBreakdown,
    publicCodeSuggestions,
    ideChat,
    platformChat,
    cli,
    seatManagementSetting,
    planType,
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotOrganizationDetails &&
        seatBreakdown == other.seatBreakdown &&
        publicCodeSuggestions == other.publicCodeSuggestions &&
        ideChat == other.ideChat &&
        platformChat == other.platformChat &&
        cli == other.cli &&
        seatManagementSetting == other.seatManagementSetting &&
        planType == other.planType &&
        mapsEqual(entries, other.entries);
  }
}
