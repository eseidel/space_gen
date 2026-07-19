import 'package:github/model_helpers.dart';
import 'package:github/models/tag_commit.dart';
import 'package:meta/meta.dart';

/// {@template tag}
/// Tag
/// Tag
/// {@endtemplate}
@immutable
class Tag {
  /// {@macro tag}
  const Tag({
    required this.name,
    required this.commit,
    required this.zipballUrl,
    required this.tarballUrl,
    required this.nodeId,
  });

  /// Converts a `Map<String, dynamic>` to a [Tag].
  factory Tag.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Tag',
      json,
      () => Tag(
        name: json['name'] as String,
        commit: TagCommit.fromJson(json['commit'] as Map<String, dynamic>),
        zipballUrl: Uri.parse(json['zipball_url'] as String),
        tarballUrl: Uri.parse(json['tarball_url'] as String),
        nodeId: json['node_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Tag? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Tag.fromJson(json);
  }

  /// Example: `'v0.1'`
  final String name;
  final TagCommit commit;

  /// Example: `'https://github.com/octocat/Hello-World/zipball/v0.1'`
  final Uri zipballUrl;

  /// Example: `'https://github.com/octocat/Hello-World/tarball/v0.1'`
  final Uri tarballUrl;
  final String nodeId;

  /// Converts a [Tag] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'commit': commit.toJson(),
      'zipball_url': zipballUrl.toString(),
      'tarball_url': tarballUrl.toString(),
      'node_id': nodeId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, commit, zipballUrl, tarballUrl, nodeId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tag &&
        name == other.name &&
        commit == other.commit &&
        zipballUrl == other.zipballUrl &&
        tarballUrl == other.tarballUrl &&
        nodeId == other.nodeId;
  }
}
