import 'package:github/model_helpers.dart';
import 'package:github/models/organization_dependabot_secret.dart';
import 'package:meta/meta.dart';

@immutable
class DependabotListOrgSecrets200Response {
  const DependabotListOrgSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotListOrgSecrets200Response].
  factory DependabotListOrgSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotListOrgSecrets200Response',
      json,
      () => DependabotListOrgSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<OrganizationDependabotSecret>(
              (e) => OrganizationDependabotSecret.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotListOrgSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotListOrgSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<OrganizationDependabotSecret> secrets;

  /// Converts a [DependabotListOrgSecrets200Response]
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
    return other is DependabotListOrgSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
