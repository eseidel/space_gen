import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateCommitCommentRequest {
  const ReposCreateCommitCommentRequest({
    required this.body,
    this.path,
    this.position,
    this.line,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateCommitCommentRequest].
  factory ReposCreateCommitCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateCommitCommentRequest',
      json,
      () => ReposCreateCommitCommentRequest(
        body: json['body'] as String,
        path: json['path'] as String?,
        position: json['position'] as int?,
        line: json['line'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateCommitCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateCommitCommentRequest.fromJson(json);
  }

  /// The contents of the comment.
  final String body;

  /// Relative path of the file to comment on.
  final String? path;

  /// Line index in the diff to comment on.
  final int? position;

  /// **Closing down notice**. Use **position** parameter instead. Line number
  /// in the file to comment on.
  final int? line;

  /// Converts a [ReposCreateCommitCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body, 'path': path, 'position': position, 'line': line};
  }

  @override
  int get hashCode => Object.hashAll([body, path, position, line]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateCommitCommentRequest &&
        body == other.body &&
        path == other.path &&
        position == other.position &&
        line == other.line;
  }
}
