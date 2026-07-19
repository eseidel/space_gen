import 'package:github/model_helpers.dart';
import 'package:github/models/organization_update_issue_type_color.dart';
import 'package:meta/meta.dart';

@immutable
class OrganizationUpdateIssueType {
  const OrganizationUpdateIssueType({
    required this.name,
    required this.isEnabled,
    this.description,
    this.color,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationUpdateIssueType].
  factory OrganizationUpdateIssueType.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationUpdateIssueType',
      json,
      () => OrganizationUpdateIssueType(
        name: json['name'] as String,
        isEnabled: json['is_enabled'] as bool,
        description: json['description'] as String?,
        color: OrganizationUpdateIssueTypeColor.maybeFromJson(
          json['color'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationUpdateIssueType? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationUpdateIssueType.fromJson(json);
  }

  /// Name of the issue type.
  final String name;

  /// Whether or not the issue type is enabled at the organization level.
  final bool isEnabled;

  /// Description of the issue type.
  final String? description;

  /// Color for the issue type.
  final OrganizationUpdateIssueTypeColor? color;

  /// Converts an [OrganizationUpdateIssueType] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'is_enabled': isEnabled,
      'description': description,
      'color': color?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, isEnabled, description, color]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationUpdateIssueType &&
        name == other.name &&
        isEnabled == other.isEnabled &&
        description == other.description &&
        color == other.color;
  }
}
