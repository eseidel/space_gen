import 'package:github/model_helpers.dart';
import 'package:github/models/organization_actions_variable.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListOrgVariables200Response {
  const ActionsListOrgVariables200Response({
    required this.totalCount,
    required this.variables,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListOrgVariables200Response].
  factory ActionsListOrgVariables200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListOrgVariables200Response',
      json,
      () => ActionsListOrgVariables200Response(
        totalCount: json['total_count'] as int,
        variables: (json['variables'] as List)
            .map<OrganizationActionsVariable>(
              (e) => OrganizationActionsVariable.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListOrgVariables200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListOrgVariables200Response.fromJson(json);
  }

  final int totalCount;
  final List<OrganizationActionsVariable> variables;

  /// Converts an [ActionsListOrgVariables200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'variables': variables.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(variables)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListOrgVariables200Response &&
        totalCount == other.totalCount &&
        listsEqual(variables, other.variables);
  }
}
