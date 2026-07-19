import 'package:github/model_helpers.dart';
import 'package:github/models/release_asset_state.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template release_asset}
/// Release Asset
/// Data related to a release.
/// {@endtemplate}
@immutable
class ReleaseAsset {
  /// {@macro release_asset}
  const ReleaseAsset({
    required this.url,
    required this.browserDownloadUrl,
    required this.id,
    required this.nodeId,
    required this.name,
    required this.label,
    required this.state,
    required this.contentType,
    required this.size,
    required this.digest,
    required this.downloadCount,
    required this.createdAt,
    required this.updatedAt,
    required this.uploader,
  });

  /// Converts a `Map<String, dynamic>` to a [ReleaseAsset].
  factory ReleaseAsset.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReleaseAsset',
      json,
      () => ReleaseAsset(
        url: Uri.parse(json['url'] as String),
        browserDownloadUrl: Uri.parse(json['browser_download_url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        label: checkedKey(json, 'label') as String?,
        state: ReleaseAssetState.fromJson(json['state'] as String),
        contentType: json['content_type'] as String,
        size: json['size'] as int,
        digest: checkedKey(json, 'digest') as String?,
        downloadCount: json['download_count'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        uploader: SimpleUser.maybeFromJson(
          checkedKey(json, 'uploader') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReleaseAsset? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReleaseAsset.fromJson(json);
  }

  final Uri url;
  final Uri browserDownloadUrl;
  final int id;
  final String nodeId;

  /// The file name of the asset.
  /// Example: `'Team Environment'`
  final String name;
  final String? label;

  /// State of the release asset.
  final ReleaseAssetState state;
  final String contentType;
  final int size;
  final String? digest;
  final int downloadCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? uploader;

  /// Converts a [ReleaseAsset] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'browser_download_url': browserDownloadUrl.toString(),
      'id': id,
      'node_id': nodeId,
      'name': name,
      'label': label,
      'state': state.toJson(),
      'content_type': contentType,
      'size': size,
      'digest': digest,
      'download_count': downloadCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'uploader': uploader?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    browserDownloadUrl,
    id,
    nodeId,
    name,
    label,
    state,
    contentType,
    size,
    digest,
    downloadCount,
    createdAt,
    updatedAt,
    uploader,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReleaseAsset &&
        url == other.url &&
        browserDownloadUrl == other.browserDownloadUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        label == other.label &&
        state == other.state &&
        contentType == other.contentType &&
        size == other.size &&
        digest == other.digest &&
        downloadCount == other.downloadCount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        uploader == other.uploader;
  }
}
