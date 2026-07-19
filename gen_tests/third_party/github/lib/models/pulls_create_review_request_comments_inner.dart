import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsCreateReviewRequestCommentsInner {
  const PullsCreateReviewRequestCommentsInner({
    required this.path,
    required this.body,
    this.position,
    this.line,
    this.side,
    this.startLine,
    this.startSide,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PullsCreateReviewRequestCommentsInner].
  factory PullsCreateReviewRequestCommentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullsCreateReviewRequestCommentsInner',
      json,
      () => PullsCreateReviewRequestCommentsInner(
        path: json['path'] as String,
        position: json['position'] as int?,
        body: json['body'] as String,
        line: json['line'] as int?,
        side: json['side'] as String?,
        startLine: json['start_line'] as int?,
        startSide: json['start_side'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsCreateReviewRequestCommentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewRequestCommentsInner.fromJson(json);
  }

  /// The relative path to the file that necessitates a review comment.
  final String path;

  /// The position in the diff where you want to add a review comment. Note
  /// this value is not the same as the line number in the file. The
  /// `position` value equals the number of lines down from the first "@@"
  /// hunk header in the file you want to add a comment. The line just below
  /// the "@@" line is position 1, the next line is position 2, and so on. The
  /// position in the diff continues to increase through lines of whitespace
  /// and additional hunks until the beginning of a new file.
  final int? position;

  /// Text of the review comment.
  final String body;

  /// Example: `28`
  final int? line;

  /// Example: `'RIGHT'`
  final String? side;

  /// Example: `26`
  final int? startLine;

  /// Example: `'LEFT'`
  final String? startSide;

  /// Converts a [PullsCreateReviewRequestCommentsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      if (position != null) 'position': position,
      'body': body,
      if (line != null) 'line': line,
      if (side != null) 'side': side,
      if (startLine != null) 'start_line': startLine,
      if (startSide != null) 'start_side': startSide,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([path, position, body, line, side, startLine, startSide]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsCreateReviewRequestCommentsInner &&
        path == other.path &&
        position == other.position &&
        body == other.body &&
        line == other.line &&
        side == other.side &&
        startLine == other.startLine &&
        startSide == other.startSide;
  }
}
