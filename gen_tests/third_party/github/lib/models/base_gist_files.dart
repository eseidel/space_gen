import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BaseGistFiles {
  const BaseGistFiles({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
    this.encoding = 'utf-8',
  });

  /// Converts a `Map<String, dynamic>` to a [BaseGistFiles].
  factory BaseGistFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BaseGistFiles',
      json,
      () => BaseGistFiles(
        filename: json['filename'] as String?,
        type: json['type'] as String?,
        language: json['language'] as String?,
        rawUrl: json['raw_url'] as String?,
        size: json['size'] as int?,
        encoding: (json['encoding'] as String?) ?? 'utf-8',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BaseGistFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BaseGistFiles.fromJson(json);
  }

  final String? filename;
  final String? type;
  final String? language;
  final String? rawUrl;
  final int? size;

  /// The encoding used for `content`. Currently, `"utf-8"` and `"base64"` are
  /// supported.
  final String encoding;

  /// Converts a [BaseGistFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'type': type,
      'language': language,
      'raw_url': rawUrl,
      'size': size,
      'encoding': encoding,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([filename, type, language, rawUrl, size, encoding]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BaseGistFiles &&
        filename == other.filename &&
        type == other.type &&
        language == other.language &&
        rawUrl == other.rawUrl &&
        size == other.size &&
        encoding == other.encoding;
  }
}
