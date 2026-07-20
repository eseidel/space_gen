import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistsCreateCommentRequest {
  GistsCreateCommentRequest({required this.body}) {
    body.validate(maxLength: 65535);
  }

  /// Converts a `Map<String, dynamic>` to a [GistsCreateCommentRequest].
  factory GistsCreateCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsCreateCommentRequest',
      json,
      () => GistsCreateCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsCreateCommentRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsCreateCommentRequest.fromJson(json);
  }

  /// The comment text.
  /// Example: `'Body of the attachment'`
  final String body;

  /// Converts a [GistsCreateCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsCreateCommentRequest && body == other.body;
  }
}
