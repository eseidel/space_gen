// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/campaigns_create_campaign_request_code_scanning_alerts_inner.dart';
import 'package:meta/meta.dart';

@immutable
class CampaignsCreateCampaignRequest {
  CampaignsCreateCampaignRequest({
    required this.name,
    required this.description,
    required this.endsAt,
    required this.codeScanningAlerts,
    this.managers,
    this.teamManagers,
    this.contactLink,
    this.generateIssues = false,
  }) {
    name.validate(minLength: 1, maxLength: 50);
    description.validate(minLength: 1, maxLength: 255);
    managers?.validate(maxItems: 10);
    teamManagers?.validate(maxItems: 10);
    codeScanningAlerts.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [CampaignsCreateCampaignRequest].
  factory CampaignsCreateCampaignRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CampaignsCreateCampaignRequest',
      json,
      () => CampaignsCreateCampaignRequest(
        name: json['name'] as String,
        description: json['description'] as String,
        managers: (json['managers'] as List?)?.cast<String>(),
        teamManagers: (json['team_managers'] as List?)?.cast<String>(),
        endsAt: DateTime.parse(json['ends_at'] as String),
        contactLink: maybeParseUri(json['contact_link'] as String?),
        codeScanningAlerts: (json['code_scanning_alerts'] as List)
            .map<CampaignsCreateCampaignRequestCodeScanningAlertsInner>(
              (e) =>
                  CampaignsCreateCampaignRequestCodeScanningAlertsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
        generateIssues: (json['generate_issues'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CampaignsCreateCampaignRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CampaignsCreateCampaignRequest.fromJson(json);
  }

  /// The name of the campaign
  final String name;

  /// A description for the campaign
  final String description;

  /// The logins of the users to set as the campaign managers. At this time,
  /// only a single manager can be supplied.
  final List<String>? managers;

  /// The slugs of the teams to set as the campaign managers.
  final List<String>? teamManagers;

  /// The end date and time of the campaign. The date must be in the future.
  final DateTime endsAt;

  /// The contact link of the campaign. Must be a URI.
  final Uri? contactLink;

  /// The code scanning alerts to include in this campaign
  final List<CampaignsCreateCampaignRequestCodeScanningAlertsInner>
  codeScanningAlerts;

  /// If true, will automatically generate issues for the campaign. The
  /// default is false.
  final bool generateIssues;

  /// Converts a [CampaignsCreateCampaignRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'managers': ?managers,
      'team_managers': ?teamManagers,
      'ends_at': endsAt.toIso8601String(),
      'contact_link': contactLink?.toString(),
      'code_scanning_alerts': codeScanningAlerts
          .map((e) => e.toJson())
          .toList(),
      'generate_issues': generateIssues,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    listHash(managers),
    listHash(teamManagers),
    endsAt,
    contactLink,
    listHash(codeScanningAlerts),
    generateIssues,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignsCreateCampaignRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(managers, other.managers) &&
        listsEqual(teamManagers, other.teamManagers) &&
        endsAt == other.endsAt &&
        contactLink == other.contactLink &&
        listsEqual(codeScanningAlerts, other.codeScanningAlerts) &&
        generateIssues == other.generateIssues;
  }
}
