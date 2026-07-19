import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistsCreateRequestFiles {
  const GistsCreateRequestFiles({required this.content});

  /// Converts a `Map<String, dynamic>` to a [GistsCreateRequestFiles].
  factory GistsCreateRequestFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsCreateRequestFiles',
      json,
      () => GistsCreateRequestFiles(content: json['content'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsCreateRequestFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsCreateRequestFiles.fromJson(json);
  }

  /// Content of the file
  final String content;

  /// Converts a [GistsCreateRequestFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsCreateRequestFiles && content == other.content;
  }
}
