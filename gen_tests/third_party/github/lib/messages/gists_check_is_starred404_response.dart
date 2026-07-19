import 'package:meta/meta.dart';

@immutable
class GistsCheckIsStarred404Response {
  const GistsCheckIsStarred404Response();

  /// Converts a `Map<String, dynamic>` to a [GistsCheckIsStarred404Response].
  factory GistsCheckIsStarred404Response.fromJson(Map<String, dynamic> _) {
    return const GistsCheckIsStarred404Response();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsCheckIsStarred404Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GistsCheckIsStarred404Response.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
