import 'package:github/model_helpers.dart';
import 'package:github/models/content_file_links.dart';
import 'package:github/models/content_file_type.dart';
import 'package:meta/meta.dart';

/// {@template content_file}
/// Content File
/// Content File
/// {@endtemplate}
@immutable
class ContentFile {
  /// {@macro content_file}
  const ContentFile({
    required this.type,
    required this.encoding,
    required this.size,
    required this.name,
    required this.path,
    required this.content,
    required this.sha,
    required this.url,
    required this.gitUrl,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.links,
    this.target,
    this.submoduleGitUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ContentFile].
  factory ContentFile.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContentFile',
      json,
      () => ContentFile(
        type: ContentFileType.fromJson(json['type'] as String),
        encoding: json['encoding'] as String,
        size: json['size'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        content: json['content'] as String,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        gitUrl: maybeParseUri(checkedKey(json, 'git_url') as String?),
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
        downloadUrl: maybeParseUri(checkedKey(json, 'download_url') as String?),
        links: ContentFileLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        target: json['target'] as String?,
        submoduleGitUrl: json['submodule_git_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentFile? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentFile.fromJson(json);
  }

  final ContentFileType type;
  final String encoding;
  final int size;
  final String name;
  final String path;
  final String content;
  final String sha;
  final Uri url;
  final Uri? gitUrl;
  final Uri? htmlUrl;
  final Uri? downloadUrl;
  final ContentFileLinks links;

  /// Example: `'"actual/actual.md"'`
  final String? target;

  /// Example: `'"git://example.com/defunkt/dotjs.git"'`
  final String? submoduleGitUrl;

  /// Converts a [ContentFile] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'encoding': encoding,
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
      if (target != null) 'target': target,
      if (submoduleGitUrl != null) 'submodule_git_url': submoduleGitUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    encoding,
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
    target,
    submoduleGitUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContentFile &&
        type == other.type &&
        encoding == other.encoding &&
        size == other.size &&
        name == other.name &&
        path == other.path &&
        content == other.content &&
        sha == other.sha &&
        url == other.url &&
        gitUrl == other.gitUrl &&
        htmlUrl == other.htmlUrl &&
        downloadUrl == other.downloadUrl &&
        links == other.links &&
        target == other.target &&
        submoduleGitUrl == other.submoduleGitUrl;
  }
}
