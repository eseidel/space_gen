import 'package:github/model_helpers.dart';
import 'package:github/models/file_commit_content_links.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitContent {
  const FileCommitContent({
    this.name,
    this.path,
    this.sha,
    this.size,
    this.url,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
    this.type,
    this.links,
  });

  /// Converts a `Map<String, dynamic>` to a [FileCommitContent].
  factory FileCommitContent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitContent',
      json,
      () => FileCommitContent(
        name: json['name'] as String?,
        path: json['path'] as String?,
        sha: json['sha'] as String?,
        size: json['size'] as int?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        gitUrl: json['git_url'] as String?,
        downloadUrl: json['download_url'] as String?,
        type: json['type'] as String?,
        links: FileCommitContentLinks.maybeFromJson(
          json['_links'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitContent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommitContent.fromJson(json);
  }

  final String? name;
  final String? path;
  final String? sha;
  final int? size;
  final String? url;
  final String? htmlUrl;
  final String? gitUrl;
  final String? downloadUrl;
  final String? type;
  final FileCommitContentLinks? links;

  /// Converts a [FileCommitContent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (sha != null) 'sha': sha,
      if (size != null) 'size': size,
      if (url != null) 'url': url,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (gitUrl != null) 'git_url': gitUrl,
      if (downloadUrl != null) 'download_url': downloadUrl,
      if (type != null) 'type': type,
      if (links != null) '_links': links?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    path,
    sha,
    size,
    url,
    htmlUrl,
    gitUrl,
    downloadUrl,
    type,
    links,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitContent &&
        name == other.name &&
        path == other.path &&
        sha == other.sha &&
        size == other.size &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        gitUrl == other.gitUrl &&
        downloadUrl == other.downloadUrl &&
        type == other.type &&
        links == other.links;
  }
}
