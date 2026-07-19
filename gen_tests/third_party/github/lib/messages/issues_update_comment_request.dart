import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesUpdateCommentRequest {
  const IssuesUpdateCommentRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to an [IssuesUpdateCommentRequest].
  factory IssuesUpdateCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesUpdateCommentRequest',
      json,
      () => IssuesUpdateCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateCommentRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateCommentRequest.fromJson(json);
  }

  /// The contents of the comment.
  final String body;

  /// Converts an [IssuesUpdateCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateCommentRequest && body == other.body;
  }
}
