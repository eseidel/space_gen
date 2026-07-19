import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistsUpdateRequestFiles {
  const GistsUpdateRequestFiles({this.content, this.filename});

  /// Converts a `Map<String, dynamic>` to a [GistsUpdateRequestFiles].
  factory GistsUpdateRequestFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsUpdateRequestFiles',
      json,
      () => GistsUpdateRequestFiles(
        content: json['content'] as String?,
        filename: json['filename'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsUpdateRequestFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsUpdateRequestFiles.fromJson(json);
  }

  /// The new content of the file.
  final String? content;

  /// The new filename for the file.
  final String? filename;

  /// Converts a [GistsUpdateRequestFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (content != null) 'content': content, 'filename': filename};
  }

  @override
  int get hashCode => Object.hashAll([content, filename]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsUpdateRequestFiles &&
        content == other.content &&
        filename == other.filename;
  }
}
