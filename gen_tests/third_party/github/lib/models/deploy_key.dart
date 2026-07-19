import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template deploy_key}
/// Deploy Key
/// An SSH key granting access to a single repository.
/// {@endtemplate}
@immutable
class DeployKey {
  /// {@macro deploy_key}
  const DeployKey({
    required this.id,
    required this.key,
    required this.url,
    required this.title,
    required this.verified,
    required this.createdAt,
    required this.readOnly,
    this.addedBy,
    this.lastUsed,
    this.enabled,
  });

  /// Converts a `Map<String, dynamic>` to a [DeployKey].
  factory DeployKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeployKey',
      json,
      () => DeployKey(
        id: json['id'] as int,
        key: json['key'] as String,
        url: json['url'] as String,
        title: json['title'] as String,
        verified: json['verified'] as bool,
        createdAt: json['created_at'] as String,
        readOnly: json['read_only'] as bool,
        addedBy: json['added_by'] as String?,
        lastUsed: json['last_used'] as String?,
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeployKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeployKey.fromJson(json);
  }

  final int id;
  final String key;
  final String url;
  final String title;
  final bool verified;
  final String createdAt;
  final bool readOnly;
  final String? addedBy;
  final String? lastUsed;
  final bool? enabled;

  /// Converts a [DeployKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'url': url,
      'title': title,
      'verified': verified,
      'created_at': createdAt,
      'read_only': readOnly,
      'added_by': addedBy,
      'last_used': lastUsed,
      if (enabled != null) 'enabled': enabled,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    key,
    url,
    title,
    verified,
    createdAt,
    readOnly,
    addedBy,
    lastUsed,
    enabled,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeployKey &&
        id == other.id &&
        key == other.key &&
        url == other.url &&
        title == other.title &&
        verified == other.verified &&
        createdAt == other.createdAt &&
        readOnly == other.readOnly &&
        addedBy == other.addedBy &&
        lastUsed == other.lastUsed &&
        enabled == other.enabled;
  }
}
