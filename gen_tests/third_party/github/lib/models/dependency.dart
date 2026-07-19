import 'package:github/model_helpers.dart';
import 'package:github/models/dependency_relationship.dart';
import 'package:github/models/dependency_scope.dart';
import 'package:github/models/metadata_1.dart';
import 'package:meta/meta.dart';

@immutable
class Dependency {
  const Dependency({
    this.packageUrl,
    this.metadata,
    this.relationship,
    this.scope,
    this.dependencies,
  });

  /// Converts a `Map<String, dynamic>` to a [Dependency].
  factory Dependency.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Dependency',
      json,
      () => Dependency(
        packageUrl: json['package_url'] as String?,
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, Metadata1.fromJson(value as dynamic)),
        ),
        relationship: DependencyRelationship.maybeFromJson(
          json['relationship'] as String?,
        ),
        scope: DependencyScope.maybeFromJson(json['scope'] as String?),
        dependencies: (json['dependencies'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Dependency? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Dependency.fromJson(json);
  }

  /// Package-url (PURL) of dependency. See
  /// https://github.com/package-url/purl-spec for more details.
  /// Example: `'pkg:/npm/%40actions/http-client@1.0.11'`
  final String? packageUrl;

  /// metadata
  /// User-defined metadata to store domain-specific information limited to 8
  /// keys with scalar values.
  final Map<String, Metadata1>? metadata;

  /// A notation of whether a dependency is requested directly by this
  /// manifest or is a dependency of another dependency.
  /// Example: `'direct'`
  final DependencyRelationship? relationship;

  /// A notation of whether the dependency is required for the primary build
  /// artifact (runtime) or is only used for development. Future versions of
  /// this specification may allow for more granular scopes.
  /// Example: `'runtime'`
  final DependencyScope? scope;

  /// Array of package-url (PURLs) of direct child dependencies.
  /// Example: `'@actions/http-client'`
  final List<String>? dependencies;

  /// Converts a [Dependency] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'package_url': ?packageUrl,
      'metadata': ?metadata?.map((key, value) => MapEntry(key, value.toJson())),
      'relationship': ?relationship?.toJson(),
      'scope': ?scope?.toJson(),
      'dependencies': ?dependencies,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    packageUrl,
    mapHash(metadata),
    relationship,
    scope,
    listHash(dependencies),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Dependency &&
        packageUrl == other.packageUrl &&
        mapsEqual(metadata, other.metadata) &&
        relationship == other.relationship &&
        scope == other.scope &&
        listsEqual(dependencies, other.dependencies);
  }
}
