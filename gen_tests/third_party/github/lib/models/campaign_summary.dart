import 'package:github/model_helpers.dart';
import 'package:github/models/campaign_state.dart';
import 'package:github/models/campaign_summary_alert_stats.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template campaign_summary}
/// Campaign summary
/// The campaign metadata and alert stats.
/// {@endtemplate}
@immutable
class CampaignSummary {
  /// {@macro campaign_summary}
  const CampaignSummary({
    required this.number,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.managers,
    required this.endsAt,
    required this.state,
    required this.contactLink,
    this.name,
    this.teamManagers,
    this.publishedAt,
    this.closedAt,
    this.alertStats,
  });

  /// Converts a `Map<String, dynamic>` to a [CampaignSummary].
  factory CampaignSummary.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CampaignSummary',
      json,
      () => CampaignSummary(
        number: json['number'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        name: json['name'] as String?,
        description: json['description'] as String,
        managers: (json['managers'] as List)
            .map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        teamManagers: (json['team_managers'] as List?)
            ?.map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
            .toList(),
        publishedAt: maybeParseDateTime(json['published_at'] as String?),
        endsAt: DateTime.parse(json['ends_at'] as String),
        closedAt: maybeParseDateTime(json['closed_at'] as String?),
        state: CampaignState.fromJson(json['state'] as String),
        contactLink: maybeParseUri(checkedKey(json, 'contact_link') as String?),
        alertStats: CampaignSummaryAlertStats.maybeFromJson(
          json['alert_stats'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CampaignSummary? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CampaignSummary.fromJson(json);
  }

  /// The number of the newly created campaign
  final int number;

  /// The date and time the campaign was created, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime createdAt;

  /// The date and time the campaign was last updated, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime updatedAt;

  /// The campaign name
  final String? name;

  /// The campaign description
  final String description;

  /// The campaign managers
  final List<SimpleUser> managers;

  /// The campaign team managers
  final List<Team>? teamManagers;

  /// The date and time the campaign was published, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime? publishedAt;

  /// The date and time the campaign has ended, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime endsAt;

  /// The date and time the campaign was closed, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ. Will be null if the campaign is still open.
  final DateTime? closedAt;

  /// Campaign state
  /// Indicates whether a campaign is open or closed
  final CampaignState state;

  /// The contact link of the campaign.
  final Uri? contactLink;
  final CampaignSummaryAlertStats? alertStats;

  /// Converts a [CampaignSummary] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'name': ?name,
      'description': description,
      'managers': managers.map((e) => e.toJson()).toList(),
      'team_managers': ?teamManagers?.map((e) => e.toJson()).toList(),
      'published_at': ?publishedAt?.toIso8601String(),
      'ends_at': endsAt.toIso8601String(),
      'closed_at': closedAt?.toIso8601String(),
      'state': state.toJson(),
      'contact_link': contactLink?.toString(),
      'alert_stats': ?alertStats?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    number,
    createdAt,
    updatedAt,
    name,
    description,
    listHash(managers),
    listHash(teamManagers),
    publishedAt,
    endsAt,
    closedAt,
    state,
    contactLink,
    alertStats,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignSummary &&
        number == other.number &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        name == other.name &&
        description == other.description &&
        listsEqual(managers, other.managers) &&
        listsEqual(teamManagers, other.teamManagers) &&
        publishedAt == other.publishedAt &&
        endsAt == other.endsAt &&
        closedAt == other.closedAt &&
        state == other.state &&
        contactLink == other.contactLink &&
        alertStats == other.alertStats;
  }
}
