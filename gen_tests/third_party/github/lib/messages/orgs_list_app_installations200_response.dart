import 'package:github/model_helpers.dart';
import 'package:github/models/installation.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsListAppInstallations200Response {
  const OrgsListAppInstallations200Response({
    required this.totalCount,
    required this.installations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsListAppInstallations200Response].
  factory OrgsListAppInstallations200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsListAppInstallations200Response',
      json,
      () => OrgsListAppInstallations200Response(
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
  static OrgsListAppInstallations200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListAppInstallations200Response.fromJson(json);
  }

  final int totalCount;
  final List<Installation> installations;

  /// Converts an [OrgsListAppInstallations200Response]
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
    return other is OrgsListAppInstallations200Response &&
        totalCount == other.totalCount &&
        listsEqual(installations, other.installations);
  }
}
