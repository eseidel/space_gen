// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsRemoveOutsideCollaborator422Response {
  const OrgsRemoveOutsideCollaborator422Response({
    this.message,
    this.documentationUrl,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsRemoveOutsideCollaborator422Response].
  factory OrgsRemoveOutsideCollaborator422Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsRemoveOutsideCollaborator422Response',
      json,
      () => OrgsRemoveOutsideCollaborator422Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsRemoveOutsideCollaborator422Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsRemoveOutsideCollaborator422Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;

  /// Converts an [OrgsRemoveOutsideCollaborator422Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': ?message, 'documentation_url': ?documentationUrl};
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsRemoveOutsideCollaborator422Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
