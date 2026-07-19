import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistSimpleFiles {
  const GistSimpleFiles({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
    this.truncated,
    this.content,
    this.encoding = 'utf-8',
  });

  /// Converts a `Map<String, dynamic>` to a [GistSimpleFiles].
  factory GistSimpleFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistSimpleFiles',
      json,
      () => GistSimpleFiles(
        filename: json['filename'] as String?,
        type: json['type'] as String?,
        language: json['language'] as String?,
        rawUrl: json['raw_url'] as String?,
        size: json['size'] as int?,
        truncated: json['truncated'] as bool?,
        content: json['content'] as String?,
        encoding: (json['encoding'] as String?) ?? 'utf-8',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistSimpleFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistSimpleFiles.fromJson(json);
  }

  final String? filename;
  final String? type;
  final String? language;
  final String? rawUrl;
  final int? size;
  final bool? truncated;
  final String? content;

  /// The encoding used for `content`. Currently, `"utf-8"` and `"base64"` are
  /// supported.
  final String? encoding;

  /// Converts a [GistSimpleFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'type': type,
      'language': language,
      'raw_url': rawUrl,
      'size': size,
      'truncated': truncated,
      'content': content,
      'encoding': encoding,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    filename,
    type,
    language,
    rawUrl,
    size,
    truncated,
    content,
    encoding,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistSimpleFiles &&
        filename == other.filename &&
        type == other.type &&
        language == other.language &&
        rawUrl == other.rawUrl &&
        size == other.size &&
        truncated == other.truncated &&
        content == other.content &&
        encoding == other.encoding;
  }
}
