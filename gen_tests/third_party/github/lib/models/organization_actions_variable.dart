// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/organization_actions_variable_visibility.dart';
import 'package:meta/meta.dart';

/// {@template organization_actions_variable}
/// Actions Variable for an Organization
/// Organization variable for GitHub Actions.
/// {@endtemplate}
@immutable
class OrganizationActionsVariable {
  /// {@macro organization_actions_variable}
  const OrganizationActionsVariable({
    required this.name,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.visibility,
    this.selectedRepositoriesUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationActionsVariable].
  factory OrganizationActionsVariable.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationActionsVariable',
      json,
      () => OrganizationActionsVariable(
        name: json['name'] as String,
        value: json['value'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        visibility: OrganizationActionsVariableVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedRepositoriesUrl: maybeParseUri(
          json['selected_repositories_url'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationActionsVariable? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationActionsVariable.fromJson(json);
  }

  /// The name of the variable.
  /// Example: `'USERNAME'`
  final String name;

  /// The value of the variable.
  /// Example: `'octocat'`
  final String value;

  /// The date and time at which the variable was created, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime createdAt;

  /// The date and time at which the variable was last updated, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime updatedAt;

  /// Visibility of a variable
  final OrganizationActionsVariableVisibility visibility;

  /// Example:
  /// `'https://api.github.com/organizations/org/variables/USERNAME/repositories'`
  final Uri? selectedRepositoriesUrl;

  /// Converts an [OrganizationActionsVariable] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'visibility': visibility.toJson(),
      'selected_repositories_url': selectedRepositoriesUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    value,
    createdAt,
    updatedAt,
    visibility,
    selectedRepositoriesUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationActionsVariable &&
        name == other.name &&
        value == other.value &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility &&
        selectedRepositoriesUrl == other.selectedRepositoriesUrl;
  }
}
