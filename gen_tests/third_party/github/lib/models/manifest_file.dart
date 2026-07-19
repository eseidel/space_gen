import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ManifestFile {
  const ManifestFile({this.sourceLocation});

  /// Converts a `Map<String, dynamic>` to a [ManifestFile].
  factory ManifestFile.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ManifestFile',
      json,
      () => ManifestFile(sourceLocation: json['source_location'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ManifestFile? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ManifestFile.fromJson(json);
  }

  /// The path of the manifest file relative to the root of the Git
  /// repository.
  /// Example: `'/src/build/package-lock.json'`
  final String? sourceLocation;

  /// Converts a [ManifestFile] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'source_location': ?sourceLocation};
  }

  @override
  int get hashCode => sourceLocation.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ManifestFile && sourceLocation == other.sourceLocation;
  }
}
