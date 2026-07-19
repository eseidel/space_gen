import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/package_package_type.dart';
import 'package:github/models/package_visibility.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template package}
/// Package
/// A software package
/// {@endtemplate}
@immutable
class Package {
  /// {@macro package}
  const Package({
    required this.id,
    required this.name,
    required this.packageType,
    required this.url,
    required this.htmlUrl,
    required this.versionCount,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    this.owner,
    this.repository,
  });

  /// Converts a `Map<String, dynamic>` to a [Package].
  factory Package.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Package',
      json,
      () => Package(
        id: json['id'] as int,
        name: json['name'] as String,
        packageType: PackagePackageType.fromJson(
          json['package_type'] as String,
        ),
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        versionCount: json['version_count'] as int,
        visibility: PackageVisibility.fromJson(json['visibility'] as String),
        owner: SimpleUser.maybeFromJson(json['owner'] as Map<String, dynamic>?),
        repository: MinimalRepository.maybeFromJson(
          json['repository'] as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Package? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Package.fromJson(json);
  }

  /// Unique identifier of the package.
  /// Example: `1`
  final int id;

  /// The name of the package.
  /// Example: `'super-linter'`
  final String name;

  /// Example: `'docker'`
  final PackagePackageType packageType;

  /// Example:
  /// `'https://api.github.com/orgs/github/packages/container/super-linter'`
  final String url;

  /// Example:
  /// `'https://github.com/orgs/github/packages/container/package/super-linter'`
  final String htmlUrl;

  /// The number of versions of the package.
  /// Example: `1`
  final int versionCount;

  /// Example: `'private'`
  final PackageVisibility visibility;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? owner;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository? repository;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts a [Package] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'package_type': packageType.toJson(),
      'url': url,
      'html_url': htmlUrl,
      'version_count': versionCount,
      'visibility': visibility.toJson(),
      'owner': owner?.toJson(),
      'repository': repository?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    packageType,
    url,
    htmlUrl,
    versionCount,
    visibility,
    owner,
    repository,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Package &&
        id == other.id &&
        name == other.name &&
        packageType == other.packageType &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        versionCount == other.versionCount &&
        visibility == other.visibility &&
        owner == other.owner &&
        repository == other.repository &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
