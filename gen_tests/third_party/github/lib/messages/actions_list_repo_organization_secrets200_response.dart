import 'package:github/model_helpers.dart';
import 'package:github/models/actions_secret.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListRepoOrganizationSecrets200Response {
  const ActionsListRepoOrganizationSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListRepoOrganizationSecrets200Response].
  factory ActionsListRepoOrganizationSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListRepoOrganizationSecrets200Response',
      json,
      () => ActionsListRepoOrganizationSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<ActionsSecret>(
              (e) => ActionsSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListRepoOrganizationSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListRepoOrganizationSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsSecret> secrets;

  /// Converts an [ActionsListRepoOrganizationSecrets200Response]
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
    return other is ActionsListRepoOrganizationSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
