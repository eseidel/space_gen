import 'package:github/model_helpers.dart';
import 'package:github/models/actions_variable.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListRepoOrganizationVariables200Response {
  const ActionsListRepoOrganizationVariables200Response({
    required this.totalCount,
    required this.variables,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListRepoOrganizationVariables200Response].
  factory ActionsListRepoOrganizationVariables200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListRepoOrganizationVariables200Response',
      json,
      () => ActionsListRepoOrganizationVariables200Response(
        totalCount: json['total_count'] as int,
        variables: (json['variables'] as List)
            .map<ActionsVariable>(
              (e) => ActionsVariable.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListRepoOrganizationVariables200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListRepoOrganizationVariables200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsVariable> variables;

  /// Converts an [ActionsListRepoOrganizationVariables200Response]
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
    return other is ActionsListRepoOrganizationVariables200Response &&
        totalCount == other.totalCount &&
        listsEqual(variables, other.variables);
  }
}
