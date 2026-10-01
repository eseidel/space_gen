// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
