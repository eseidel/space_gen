import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsAddOrUpdateProjectPermissionsLegacy403Response {
  const TeamsAddOrUpdateProjectPermissionsLegacy403Response({
    this.message,
    this.documentationUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsAddOrUpdateProjectPermissionsLegacy403Response].
  factory TeamsAddOrUpdateProjectPermissionsLegacy403Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsAddOrUpdateProjectPermissionsLegacy403Response',
      json,
      () => TeamsAddOrUpdateProjectPermissionsLegacy403Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateProjectPermissionsLegacy403Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateProjectPermissionsLegacy403Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;

  /// Converts a [TeamsAddOrUpdateProjectPermissionsLegacy403Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsAddOrUpdateProjectPermissionsLegacy403Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
