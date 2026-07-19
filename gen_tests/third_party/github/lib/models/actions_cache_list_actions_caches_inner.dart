import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCacheListActionsCachesInner {
  const ActionsCacheListActionsCachesInner({
    this.id,
    this.ref,
    this.key,
    this.version,
    this.lastAccessedAt,
    this.createdAt,
    this.sizeInBytes,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCacheListActionsCachesInner].
  factory ActionsCacheListActionsCachesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCacheListActionsCachesInner',
      json,
      () => ActionsCacheListActionsCachesInner(
        id: json['id'] as int?,
        ref: json['ref'] as String?,
        key: json['key'] as String?,
        version: json['version'] as String?,
        lastAccessedAt: maybeParseDateTime(json['last_accessed_at'] as String?),
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        sizeInBytes: json['size_in_bytes'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCacheListActionsCachesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCacheListActionsCachesInner.fromJson(json);
  }

  /// Example: `2`
  final int? id;

  /// Example: `'refs/heads/main'`
  final String? ref;

  /// Example: `'Linux-node-958aff96db2d75d67787d1e634ae70b659de937b'`
  final String? key;

  /// Example:
  /// `'73885106f58cc52a7df9ec4d4a5622a5614813162cb516c759a30af6bf56e6f0'`
  final String? version;

  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime? lastAccessedAt;

  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime? createdAt;

  /// Example: `1024`
  final int? sizeInBytes;

  /// Converts an [ActionsCacheListActionsCachesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'ref': ?ref,
      'key': ?key,
      'version': ?version,
      'last_accessed_at': ?lastAccessedAt?.toIso8601String(),
      'created_at': ?createdAt?.toIso8601String(),
      'size_in_bytes': ?sizeInBytes,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    ref,
    key,
    version,
    lastAccessedAt,
    createdAt,
    sizeInBytes,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCacheListActionsCachesInner &&
        id == other.id &&
        ref == other.ref &&
        key == other.key &&
        version == other.version &&
        lastAccessedAt == other.lastAccessedAt &&
        createdAt == other.createdAt &&
        sizeInBytes == other.sizeInBytes;
  }
}
