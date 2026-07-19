import 'package:github/model_helpers.dart';
import 'package:github/models/gists_create_request_files.dart';
import 'package:github/models/gists_create_request_public.dart';
import 'package:meta/meta.dart';

@immutable
class GistsCreateRequest {
  const GistsCreateRequest({
    required this.files,
    this.description,
    this.public,
  });

  /// Converts a `Map<String, dynamic>` to a [GistsCreateRequest].
  factory GistsCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistsCreateRequest',
      json,
      () => GistsCreateRequest(
        description: json['description'] as String?,
        files: (json['files'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            GistsCreateRequestFiles.fromJson(value as Map<String, dynamic>),
          ),
        ),
        public: GistsCreateRequestPublic.maybeFromJson(
          json['public'] as dynamic,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistsCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistsCreateRequest.fromJson(json);
  }

  /// Description of the gist
  /// Example: `'Example Ruby script'`
  final String? description;

  /// Names and content for the files that make up the gist
  /// Example:
  /// ```json
  /// {
  ///   "hello.rb": {
  ///     "content": "puts \"Hello, World!\""
  ///   }
  /// }
  /// ```
  final Map<String, GistsCreateRequestFiles> files;
  final GistsCreateRequestPublic? public;

  /// Converts a [GistsCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': ?description,
      'files': files.map((key, value) => MapEntry(key, value.toJson())),
      'public': ?public?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([description, mapHash(files), public]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistsCreateRequest &&
        description == other.description &&
        mapsEqual(files, other.files) &&
        public == other.public;
  }
}
