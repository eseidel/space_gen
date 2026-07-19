import 'package:github/model_helpers.dart';
import 'package:github/models/package_version_metadata_container.dart';
import 'package:github/models/package_version_metadata_docker.dart';
import 'package:github/models/package_version_metadata_package_type.dart';
import 'package:meta/meta.dart';

/// {@template package_version_metadata}
/// Package Version Metadata
/// {@endtemplate}
@immutable
class PackageVersionMetadata {
  /// {@macro package_version_metadata}
  const PackageVersionMetadata({
    required this.packageType,
    this.container,
    this.docker,
  });

  /// Converts a `Map<String, dynamic>` to a [PackageVersionMetadata].
  factory PackageVersionMetadata.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PackageVersionMetadata',
      json,
      () => PackageVersionMetadata(
        packageType: PackageVersionMetadataPackageType.fromJson(
          json['package_type'] as String,
        ),
        container: PackageVersionMetadataContainer.maybeFromJson(
          json['container'] as Map<String, dynamic>?,
        ),
        docker: PackageVersionMetadataDocker.maybeFromJson(
          json['docker'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PackageVersionMetadata? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PackageVersionMetadata.fromJson(json);
  }

  /// Example: `'docker'`
  final PackageVersionMetadataPackageType packageType;

  /// Container Metadata
  final PackageVersionMetadataContainer? container;

  /// Docker Metadata
  final PackageVersionMetadataDocker? docker;

  /// Converts a [PackageVersionMetadata] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'package_type': packageType.toJson(),
      'container': ?container?.toJson(),
      'docker': ?docker?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([packageType, container, docker]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackageVersionMetadata &&
        packageType == other.packageType &&
        container == other.container &&
        docker == other.docker;
  }
}
