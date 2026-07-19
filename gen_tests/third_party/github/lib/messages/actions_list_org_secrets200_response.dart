import 'package:github/model_helpers.dart';
import 'package:github/models/organization_actions_secret.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListOrgSecrets200Response {
  const ActionsListOrgSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListOrgSecrets200Response].
  factory ActionsListOrgSecrets200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsListOrgSecrets200Response',
      json,
      () => ActionsListOrgSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<OrganizationActionsSecret>(
              (e) =>
                  OrganizationActionsSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListOrgSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListOrgSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<OrganizationActionsSecret> secrets;

  /// Converts an [ActionsListOrgSecrets200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'secrets': secrets.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(secrets)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListOrgSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
