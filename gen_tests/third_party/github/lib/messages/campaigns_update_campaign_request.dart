import 'package:github/model_helpers.dart';
import 'package:github/models/campaign_state.dart';
import 'package:meta/meta.dart';

@immutable
class CampaignsUpdateCampaignRequest {
  const CampaignsUpdateCampaignRequest({
    this.name,
    this.description,
    this.managers,
    this.teamManagers,
    this.endsAt,
    this.contactLink,
    this.state,
  });

  /// Converts a `Map<String, dynamic>` to a [CampaignsUpdateCampaignRequest].
  factory CampaignsUpdateCampaignRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CampaignsUpdateCampaignRequest',
      json,
      () => CampaignsUpdateCampaignRequest(
        name: json['name'] as String?,
        description: json['description'] as String?,
        managers: (json['managers'] as List?)?.cast<String>(),
        teamManagers: (json['team_managers'] as List?)?.cast<String>(),
        endsAt: maybeParseDateTime(json['ends_at'] as String?),
        contactLink: maybeParseUri(json['contact_link'] as String?),
        state: CampaignState.maybeFromJson(json['state'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CampaignsUpdateCampaignRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CampaignsUpdateCampaignRequest.fromJson(json);
  }

  /// The name of the campaign
  final String? name;

  /// A description for the campaign
  final String? description;

  /// The logins of the users to set as the campaign managers. At this time,
  /// only a single manager can be supplied.
  final List<String>? managers;

  /// The slugs of the teams to set as the campaign managers.
  final List<String>? teamManagers;

  /// The end date and time of the campaign, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime? endsAt;

  /// The contact link of the campaign. Must be a URI.
  final Uri? contactLink;

  /// Campaign state
  /// Indicates whether a campaign is open or closed
  final CampaignState? state;

  /// Converts a [CampaignsUpdateCampaignRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'description': ?description,
      'managers': ?managers,
      'team_managers': ?teamManagers,
      'ends_at': ?endsAt?.toIso8601String(),
      'contact_link': contactLink?.toString(),
      'state': ?state?.toJson(),
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
    state,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignsUpdateCampaignRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(managers, other.managers) &&
        listsEqual(teamManagers, other.teamManagers) &&
        endsAt == other.endsAt &&
        contactLink == other.contactLink &&
        state == other.state;
  }
}
