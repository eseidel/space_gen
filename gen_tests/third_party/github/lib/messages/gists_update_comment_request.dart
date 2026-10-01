// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistsUpdateCommentRequest {
  GistsUpdateCommentRequest({required this.body}) {
    body.validate(maxLength: 65535);
  }

  /// Converts a `Map<String, dynamic>` to a [GistsUpdateCommentRequest].
  factory GistsUpdateCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsUpdateCommentRequest',
      json,
      () => GistsUpdateCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsUpdateCommentRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsUpdateCommentRequest.fromJson(json);
  }

  /// The comment text.
  /// Example: `'Body of the attachment'`
  final String body;

  /// Converts a [GistsUpdateCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsUpdateCommentRequest && body == other.body;
  }
}
