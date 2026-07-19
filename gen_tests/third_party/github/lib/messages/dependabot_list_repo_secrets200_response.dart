import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_secret.dart';
import 'package:meta/meta.dart';

@immutable
class DependabotListRepoSecrets200Response {
  const DependabotListRepoSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotListRepoSecrets200Response].
  factory DependabotListRepoSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotListRepoSecrets200Response',
      json,
      () => DependabotListRepoSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<DependabotSecret>(
              (e) => DependabotSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotListRepoSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotListRepoSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<DependabotSecret> secrets;

  /// Converts a [DependabotListRepoSecrets200Response]
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
    return other is DependabotListRepoSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
