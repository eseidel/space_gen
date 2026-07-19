import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_commit_comment_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForCommitCommentRequest {
  const ReactionsCreateForCommitCommentRequest({required this.content});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReactionsCreateForCommitCommentRequest].
  factory ReactionsCreateForCommitCommentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReactionsCreateForCommitCommentRequest',
      json,
      () => ReactionsCreateForCommitCommentRequest(
        content: ReactionsCreateForCommitCommentRequestContent.fromJson(
          json['content'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForCommitCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForCommitCommentRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the commit comment.
  final ReactionsCreateForCommitCommentRequestContent content;

  /// Converts a [ReactionsCreateForCommitCommentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForCommitCommentRequest &&
        content == other.content;
  }
}
