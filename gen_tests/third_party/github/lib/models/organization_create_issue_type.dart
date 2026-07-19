import 'package:github/model_helpers.dart';
import 'package:github/models/organization_create_issue_type_color.dart';
import 'package:meta/meta.dart';

@immutable
class OrganizationCreateIssueType {
  const OrganizationCreateIssueType({
    required this.name,
    required this.isEnabled,
    this.description,
    this.color,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationCreateIssueType].
  factory OrganizationCreateIssueType.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationCreateIssueType',
      json,
      () => OrganizationCreateIssueType(
        name: json['name'] as String,
        isEnabled: json['is_enabled'] as bool,
        description: json['description'] as String?,
        color: OrganizationCreateIssueTypeColor.maybeFromJson(
          json['color'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationCreateIssueType? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationCreateIssueType.fromJson(json);
  }

  /// Name of the issue type.
  final String name;

  /// Whether or not the issue type is enabled at the organization level.
  final bool isEnabled;

  /// Description of the issue type.
  final String? description;

  /// Color for the issue type.
  final OrganizationCreateIssueTypeColor? color;

  /// Converts an [OrganizationCreateIssueType] to a `Map<String, dynamic>`.
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
    return other is OrganizationCreateIssueType &&
        name == other.name &&
        isEnabled == other.isEnabled &&
        description == other.description &&
        color == other.color;
  }
}
