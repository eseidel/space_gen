import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template package_version_metadata_container}
/// Container Metadata
/// {@endtemplate}
@immutable
class PackageVersionMetadataContainer {
  /// {@macro package_version_metadata_container}
  const PackageVersionMetadataContainer({required this.tags});

  /// Converts a `Map<String, dynamic>` to a [PackageVersionMetadataContainer].
  factory PackageVersionMetadataContainer.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PackageVersionMetadataContainer',
      json,
      () => PackageVersionMetadataContainer(
        tags: (json['tags'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PackageVersionMetadataContainer? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PackageVersionMetadataContainer.fromJson(json);
  }

  final List<String> tags;

  /// Converts a [PackageVersionMetadataContainer] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'tags': tags};
  }

  @override
  int get hashCode => listHash(tags).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackageVersionMetadataContainer &&
        listsEqual(tags, other.tags);
  }
}
