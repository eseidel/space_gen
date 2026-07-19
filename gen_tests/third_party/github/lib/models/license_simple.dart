import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template license_simple}
/// License Simple
/// License Simple
/// {@endtemplate}
@immutable
class LicenseSimple {
  /// {@macro license_simple}
  const LicenseSimple({
    required this.key,
    required this.name,
    required this.url,
    required this.spdxId,
    required this.nodeId,
    this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [LicenseSimple].
  factory LicenseSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LicenseSimple',
      json,
      () => LicenseSimple(
        key: json['key'] as String,
        name: json['name'] as String,
        url: maybeParseUri(checkedKey(json, 'url') as String?),
        spdxId: checkedKey(json, 'spdx_id') as String?,
        nodeId: json['node_id'] as String,
        htmlUrl: maybeParseUri(json['html_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LicenseSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LicenseSimple.fromJson(json);
  }

  /// Example: `'mit'`
  final String key;

  /// Example: `'MIT License'`
  final String name;

  /// Example: `'https://api.github.com/licenses/mit'`
  final Uri? url;

  /// Example: `'MIT'`
  final String? spdxId;

  /// Example: `'MDc6TGljZW5zZW1pdA=='`
  final String nodeId;
  final Uri? htmlUrl;

  /// Converts a [LicenseSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'url': url?.toString(),
      'spdx_id': spdxId,
      'node_id': nodeId,
      'html_url': htmlUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([key, name, url, spdxId, nodeId, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LicenseSimple &&
        key == other.key &&
        name == other.name &&
        url == other.url &&
        spdxId == other.spdxId &&
        nodeId == other.nodeId &&
        htmlUrl == other.htmlUrl;
  }
}
