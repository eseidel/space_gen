import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template package_version_metadata_docker}
/// Docker Metadata
/// {@endtemplate}
@immutable
class PackageVersionMetadataDocker {
  /// {@macro package_version_metadata_docker}
  const PackageVersionMetadataDocker({this.tag});

  /// Converts a `Map<String, dynamic>` to a [PackageVersionMetadataDocker].
  factory PackageVersionMetadataDocker.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PackageVersionMetadataDocker',
      json,
      () => PackageVersionMetadataDocker(
        tag: (json['tag'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PackageVersionMetadataDocker? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PackageVersionMetadataDocker.fromJson(json);
  }

  final List<String>? tag;

  /// Converts a [PackageVersionMetadataDocker] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (tag != null) 'tag': tag};
  }

  @override
  int get hashCode => listHash(tag).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackageVersionMetadataDocker && listsEqual(tag, other.tag);
  }
}
