// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/gists_update_request_files.dart';
import 'package:meta/meta.dart';

@immutable
class GistsUpdateRequest {
  const GistsUpdateRequest({this.description, this.files});

  /// Converts a `Map<String, dynamic>` to a [GistsUpdateRequest].
  factory GistsUpdateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsUpdateRequest',
      json,
      () => GistsUpdateRequest(
        description: json['description'] as String?,
        files: (json['files'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            GistsUpdateRequestFiles.fromJson(value as Map<String, dynamic>),
          ),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsUpdateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsUpdateRequest.fromJson(json);
  }

  /// The description of the gist.
  /// Example: `'Example Ruby script'`
  final String? description;

  /// The gist files to be updated, renamed, or deleted. Each `key` must match
  /// the current filename
  /// (including extension) of the targeted gist file. For example:
  /// `hello.py`.
  ///
  /// To delete a file, set the whole file to null. For example: `hello.py : null`.
  /// The file will also be
  /// deleted if the specified object does not contain at least one of
  /// `content` or `filename`.
  /// Example:
  /// ```json
  /// {
  ///   "hello.rb": {
  ///     "content": "blah",
  ///     "filename": "goodbye.rb"
  ///   }
  /// }
  /// ```
  final Map<String, GistsUpdateRequestFiles>? files;

  /// Converts a [GistsUpdateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (description != null) 'description': description,
      if (files != null)
        'files': files?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }

  @override
  int get hashCode => Object.hashAll([description, mapHash(files)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsUpdateRequest &&
        description == other.description &&
        mapsEqual(files, other.files);
  }
}
