// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/package_version_metadata.dart';
import 'package:meta/meta.dart';

/// {@template package_version}
/// Package Version
/// A version of a software package
/// {@endtemplate}
@immutable
class PackageVersion {
  /// {@macro package_version}
  const PackageVersion({
    required this.id,
    required this.name,
    required this.url,
    required this.packageHtmlUrl,
    required this.createdAt,
    required this.updatedAt,
    this.htmlUrl,
    this.license,
    this.description,
    this.deletedAt,
    this.metadata,
  });

  /// Converts a `Map<String, dynamic>` to a [PackageVersion].
  factory PackageVersion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PackageVersion',
      json,
      () => PackageVersion(
        id: json['id'] as int,
        name: json['name'] as String,
        url: json['url'] as String,
        packageHtmlUrl: json['package_html_url'] as String,
        htmlUrl: json['html_url'] as String?,
        license: json['license'] as String?,
        description: json['description'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        deletedAt: maybeParseDateTime(json['deleted_at'] as String?),
        metadata: PackageVersionMetadata.maybeFromJson(
          json['metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PackageVersion? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PackageVersion.fromJson(json);
  }

  /// Unique identifier of the package version.
  /// Example: `1`
  final int id;

  /// The name of the package version.
  /// Example: `'latest'`
  final String name;

  /// Example:
  /// `'https://api.github.com/orgs/github/packages/container/super-linter/versions/786068'`
  final String url;

  /// Example:
  /// `'https://github.com/orgs/github/packages/container/package/super-linter'`
  final String packageHtmlUrl;

  /// Example:
  /// `'https://github.com/orgs/github/packages/container/super-linter/786068'`
  final String? htmlUrl;

  /// Example: `'MIT'`
  final String? license;
  final String? description;

  /// Example: `'2011-04-10T20:09:31Z'`
  final DateTime createdAt;

  /// Example: `'2014-03-03T18:58:10Z'`
  final DateTime updatedAt;

  /// Example: `'2014-03-03T18:58:10Z'`
  final DateTime? deletedAt;

  /// Package Version Metadata
  final PackageVersionMetadata? metadata;

  /// Converts a [PackageVersion] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'package_html_url': packageHtmlUrl,
      'html_url': htmlUrl,
      'license': license,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'metadata': metadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    url,
    packageHtmlUrl,
    htmlUrl,
    license,
    description,
    createdAt,
    updatedAt,
    deletedAt,
    metadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackageVersion &&
        id == other.id &&
        name == other.name &&
        url == other.url &&
        packageHtmlUrl == other.packageHtmlUrl &&
        htmlUrl == other.htmlUrl &&
        license == other.license &&
        description == other.description &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        metadata == other.metadata;
  }
}
