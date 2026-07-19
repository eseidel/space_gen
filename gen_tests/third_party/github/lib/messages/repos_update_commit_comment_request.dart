import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateCommitCommentRequest {
  const ReposUpdateCommitCommentRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateCommitCommentRequest].
  factory ReposUpdateCommitCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateCommitCommentRequest',
      json,
      () => ReposUpdateCommitCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateCommitCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateCommitCommentRequest.fromJson(json);
  }

  /// The contents of the comment
  final String body;

  /// Converts a [ReposUpdateCommitCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateCommitCommentRequest && body == other.body;
  }
}
