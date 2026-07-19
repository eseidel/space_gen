import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateBlobRequest {
  const GitCreateBlobRequest({required this.content, this.encoding = 'utf-8'});

  /// Converts a `Map<String, dynamic>` to a [GitCreateBlobRequest].
  factory GitCreateBlobRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateBlobRequest',
      json,
      () => GitCreateBlobRequest(
        content: json['content'] as String,
        encoding: (json['encoding'] as String?) ?? 'utf-8',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateBlobRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateBlobRequest.fromJson(json);
  }

  /// The new blob's content.
  final String content;

  /// The encoding used for `content`. Currently, `"utf-8"` and `"base64"` are
  /// supported.
  final String? encoding;

  /// Converts a [GitCreateBlobRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content, 'encoding': encoding};
  }

  @override
  int get hashCode => Object.hashAll([content, encoding]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateBlobRequest &&
        content == other.content &&
        encoding == other.encoding;
  }
}
