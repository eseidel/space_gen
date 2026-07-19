import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGetHostedRunnersPlatformsForOrg200Response {
  const ActionsGetHostedRunnersPlatformsForOrg200Response({
    required this.totalCount,
    required this.platforms,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGetHostedRunnersPlatformsForOrg200Response].
  factory ActionsGetHostedRunnersPlatformsForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGetHostedRunnersPlatformsForOrg200Response',
      json,
      () => ActionsGetHostedRunnersPlatformsForOrg200Response(
        totalCount: json['total_count'] as int,
        platforms: (json['platforms'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGetHostedRunnersPlatformsForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGetHostedRunnersPlatformsForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<String> platforms;

  /// Converts an [ActionsGetHostedRunnersPlatformsForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total_count': totalCount, 'platforms': platforms};
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(platforms)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGetHostedRunnersPlatformsForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(platforms, other.platforms);
  }
}
