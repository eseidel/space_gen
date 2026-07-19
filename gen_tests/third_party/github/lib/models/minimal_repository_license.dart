import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MinimalRepositoryLicense {
  const MinimalRepositoryLicense({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  /// Converts a `Map<String, dynamic>` to a [MinimalRepositoryLicense].
  factory MinimalRepositoryLicense.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MinimalRepositoryLicense',
      json,
      () => MinimalRepositoryLicense(
        key: json['key'] as String?,
        name: json['name'] as String?,
        spdxId: json['spdx_id'] as String?,
        url: json['url'] as String?,
        nodeId: json['node_id'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MinimalRepositoryLicense? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MinimalRepositoryLicense.fromJson(json);
  }

  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  /// Converts a [MinimalRepositoryLicense] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': ?key,
      'name': ?name,
      'spdx_id': ?spdxId,
      'url': ?url,
      'node_id': ?nodeId,
    };
  }

  @override
  int get hashCode => Object.hashAll([key, name, spdxId, url, nodeId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MinimalRepositoryLicense &&
        key == other.key &&
        name == other.name &&
        spdxId == other.spdxId &&
        url == other.url &&
        nodeId == other.nodeId;
  }
}
