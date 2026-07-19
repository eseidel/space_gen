// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// The team through which the assignee is granted access to GitHub Copilot, if
/// applicable.
sealed class CopilotSeatDetailsAssigningTeam {
  const CopilotSeatDetailsAssigningTeam();

  factory CopilotSeatDetailsAssigningTeam.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('node_id')) {
      return CopilotSeatDetailsAssigningTeamTeam(Team.fromJson(json));
    }
    if (json.containsKey('created_at')) {
      return EnterpriseTeam.fromJson(json);
    }
    throw FormatException(
      'No variant of CopilotSeatDetailsAssigningTeam matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotSeatDetailsAssigningTeam? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotSeatDetailsAssigningTeam.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CopilotSeatDetailsAssigningTeamTeam
    extends CopilotSeatDetailsAssigningTeam {
  const CopilotSeatDetailsAssigningTeamTeam(this.value);

  final Team value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotSeatDetailsAssigningTeamTeam && value == other.value;
  }
}

/// {@template enterprise_team}
/// Enterprise Team
/// Group of enterprise owners and/or members
/// {@endtemplate}
@immutable
final class EnterpriseTeam extends CopilotSeatDetailsAssigningTeam {
  /// {@macro enterprise_team}
  const EnterpriseTeam({
    required this.id,
    required this.name,
    required this.slug,
    required this.url,
    required this.htmlUrl,
    required this.membersUrl,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.syncToOrganizations,
    this.organizationSelectionType,
    this.groupId,
    this.groupName,
  });

  /// Converts a `Map<String, dynamic>` to an [EnterpriseTeam].
  factory EnterpriseTeam.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EnterpriseTeam',
      json,
      () => EnterpriseTeam(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String?,
        slug: json['slug'] as String,
        url: Uri.parse(json['url'] as String),
        syncToOrganizations: json['sync_to_organizations'] as String?,
        organizationSelectionType:
            json['organization_selection_type'] as String?,
        groupId: json['group_id'] as String?,
        groupName: json['group_name'] as String?,
        htmlUrl: Uri.parse(json['html_url'] as String),
        membersUrl: json['members_url'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnterpriseTeam? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EnterpriseTeam.fromJson(json);
  }

  final int id;
  final String name;
  final String? description;
  final String slug;
  final Uri url;

  /// Example: `'disabled | all'`
  final String? syncToOrganizations;

  /// Example: `'disabled | all'`
  final String? organizationSelectionType;

  /// Example: `'62ab9291-fae2-468e-974b-7e45096d5021'`
  final String? groupId;

  /// Example: `'Justice League'`
  final String? groupName;

  /// Example: `'https://github.com/enterprises/dc/teams/justice-league'`
  final Uri htmlUrl;
  final String membersUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts an [EnterpriseTeam] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': ?description,
      'slug': slug,
      'url': url.toString(),
      'sync_to_organizations': ?syncToOrganizations,
      'organization_selection_type': ?organizationSelectionType,
      'group_id': groupId,
      'group_name': groupName,
      'html_url': htmlUrl.toString(),
      'members_url': membersUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    description,
    slug,
    url,
    syncToOrganizations,
    organizationSelectionType,
    groupId,
    groupName,
    htmlUrl,
    membersUrl,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnterpriseTeam &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        slug == other.slug &&
        url == other.url &&
        syncToOrganizations == other.syncToOrganizations &&
        organizationSelectionType == other.organizationSelectionType &&
        groupId == other.groupId &&
        groupName == other.groupName &&
        htmlUrl == other.htmlUrl &&
        membersUrl == other.membersUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
