import 'package:github/model_helpers.dart';
import 'package:github/models/installation.dart';
import 'package:meta/meta.dart';

@immutable
class AppsListInstallationsForAuthenticatedUser200Response {
  const AppsListInstallationsForAuthenticatedUser200Response({
    required this.totalCount,
    required this.installations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [AppsListInstallationsForAuthenticatedUser200Response].
  factory AppsListInstallationsForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'AppsListInstallationsForAuthenticatedUser200Response',
      json,
      () => AppsListInstallationsForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        installations: (json['installations'] as List)
            .map<Installation>(
              (e) => Installation.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsListInstallationsForAuthenticatedUser200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsListInstallationsForAuthenticatedUser200Response.fromJson(json);
  }

  final int totalCount;
  final List<Installation> installations;

  /// Converts an [AppsListInstallationsForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'installations': installations.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(installations)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsListInstallationsForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(installations, other.installations);
  }
}
