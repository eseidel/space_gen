import 'package:github/model_helpers.dart';
import 'package:github/models/dependency.dart';
import 'package:github/models/manifest_file.dart';
import 'package:github/models/metadata_1.dart';
import 'package:meta/meta.dart';

@immutable
class Manifest {
  const Manifest({required this.name, this.file, this.metadata, this.resolved});

  /// Converts a `Map<String, dynamic>` to a [Manifest].
  factory Manifest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Manifest',
      json,
      () => Manifest(
        name: json['name'] as String,
        file: ManifestFile.maybeFromJson(json['file'] as Map<String, dynamic>?),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, Metadata1.fromJson(value as dynamic)),
        ),
        resolved: (json['resolved'] as Map<String, dynamic>?)?.map(
          (key, value) =>
              MapEntry(key, Dependency.fromJson(value as Map<String, dynamic>)),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Manifest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Manifest.fromJson(json);
  }

  /// The name of the manifest.
  /// Example: `'package-lock.json'`
  final String name;
  final ManifestFile? file;

  /// metadata
  /// User-defined metadata to store domain-specific information limited to 8
  /// keys with scalar values.
  final Map<String, Metadata1>? metadata;

  /// A collection of resolved package dependencies.
  final Map<String, Dependency>? resolved;

  /// Converts a [Manifest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'file': ?file?.toJson(),
      'metadata': ?metadata?.map((key, value) => MapEntry(key, value.toJson())),
      'resolved': ?resolved?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, file, mapHash(metadata), mapHash(resolved)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Manifest &&
        name == other.name &&
        file == other.file &&
        mapsEqual(metadata, other.metadata) &&
        mapsEqual(resolved, other.resolved);
  }
}
