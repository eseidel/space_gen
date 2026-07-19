import 'package:github/model_helpers.dart';
import 'package:github/models/environment.dart';
import 'package:meta/meta.dart';

@immutable
class ReposGetAllEnvironments200Response {
  const ReposGetAllEnvironments200Response({
    this.totalCount,
    this.environments,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposGetAllEnvironments200Response].
  factory ReposGetAllEnvironments200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposGetAllEnvironments200Response',
      json,
      () => ReposGetAllEnvironments200Response(
        totalCount: json['total_count'] as int?,
        environments: (json['environments'] as List?)
            ?.map<Environment>(
              (e) => Environment.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposGetAllEnvironments200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposGetAllEnvironments200Response.fromJson(json);
  }

  /// The number of environments in this repository
  /// Example: `5`
  final int? totalCount;
  final List<Environment>? environments;

  /// Converts a [ReposGetAllEnvironments200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (totalCount != null) 'total_count': totalCount,
      if (environments != null)
        'environments': environments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(environments)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetAllEnvironments200Response &&
        totalCount == other.totalCount &&
        listsEqual(environments, other.environments);
  }
}
