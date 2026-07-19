import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistSimpleForkOfFiles {
  const GistSimpleForkOfFiles({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
  });

  /// Converts a `Map<String, dynamic>` to a [GistSimpleForkOfFiles].
  factory GistSimpleForkOfFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistSimpleForkOfFiles',
      json,
      () => GistSimpleForkOfFiles(
        filename: json['filename'] as String?,
        type: json['type'] as String?,
        language: json['language'] as String?,
        rawUrl: json['raw_url'] as String?,
        size: json['size'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistSimpleForkOfFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistSimpleForkOfFiles.fromJson(json);
  }

  final String? filename;
  final String? type;
  final String? language;
  final String? rawUrl;
  final int? size;

  /// Converts a [GistSimpleForkOfFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'filename': ?filename,
      'type': ?type,
      'language': ?language,
      'raw_url': ?rawUrl,
      'size': ?size,
    };
  }

  @override
  int get hashCode => Object.hashAll([filename, type, language, rawUrl, size]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistSimpleForkOfFiles &&
        filename == other.filename &&
        type == other.type &&
        language == other.language &&
        rawUrl == other.rawUrl &&
        size == other.size;
  }
}
