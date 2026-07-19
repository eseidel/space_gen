import 'package:github/model_helpers.dart';
import 'package:github/models/content_directory_inner_links.dart';
import 'package:github/models/content_directory_inner_type.dart';
import 'package:meta/meta.dart';

@immutable
class ContentDirectoryInner {
  const ContentDirectoryInner({
    required this.type,
    required this.size,
    required this.name,
    required this.path,
    required this.sha,
    required this.url,
    required this.gitUrl,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.links,
    this.content,
  });

  /// Converts a `Map<String, dynamic>` to a [ContentDirectoryInner].
  factory ContentDirectoryInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContentDirectoryInner',
      json,
      () => ContentDirectoryInner(
        type: ContentDirectoryInnerType.fromJson(json['type'] as String),
        size: json['size'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        content: json['content'] as String?,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        gitUrl: maybeParseUri(checkedKey(json, 'git_url') as String?),
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
        downloadUrl: maybeParseUri(checkedKey(json, 'download_url') as String?),
        links: ContentDirectoryInnerLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentDirectoryInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentDirectoryInner.fromJson(json);
  }

  final ContentDirectoryInnerType type;
  final int size;
  final String name;
  final String path;
  final String? content;
  final String sha;
  final Uri url;
  final Uri? gitUrl;
  final Uri? htmlUrl;
  final Uri? downloadUrl;
  final ContentDirectoryInnerLinks links;

  /// Converts a [ContentDirectoryInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'size': size,
      'name': name,
      'path': path,
      'content': content,
      'sha': sha,
      'url': url.toString(),
      'git_url': gitUrl?.toString(),
      'html_url': htmlUrl?.toString(),
      'download_url': downloadUrl?.toString(),
      '_links': links.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    size,
    name,
    path,
    content,
    sha,
    url,
    gitUrl,
    htmlUrl,
    downloadUrl,
    links,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContentDirectoryInner &&
        type == other.type &&
        size == other.size &&
        name == other.name &&
        path == other.path &&
        content == other.content &&
        sha == other.sha &&
        url == other.url &&
        gitUrl == other.gitUrl &&
        htmlUrl == other.htmlUrl &&
        downloadUrl == other.downloadUrl &&
        links == other.links;
  }
}
