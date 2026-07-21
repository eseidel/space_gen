// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/content_directory_inner.dart';
import 'package:github/models/content_file.dart';
import 'package:github/models/content_submodule_links.dart';
import 'package:github/models/content_symlink_links.dart';
import 'package:meta/meta.dart';

sealed class ReposGetContent200Response {
  const ReposGetContent200Response();

  factory ReposGetContent200Response.fromJson(dynamic json) {
    return switch (json) {
      final List<dynamic> v => ReposGetContent200ResponseList(
        v
            .map<ContentDirectoryInner>(
              (e) => ContentDirectoryInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      final Map<String, dynamic> v when v.containsKey('content') =>
        ReposGetContent200ResponseContentFile(ContentFile.fromJson(v)),
      final Map<String, dynamic> v when v.containsKey('target') =>
        ContentSymlink.fromJson(v),
      final Map<String, dynamic> v when v.containsKey('submodule_git_url') =>
        ContentSubmodule.fromJson(v),
      final Map<String, dynamic> v => throw FormatException(
        'No variant of ReposGetContent200Response matched json keys: ${v.keys.toList()}',
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposGetContent200Response: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposGetContent200Response? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposGetContent200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposGetContent200ResponseList extends ReposGetContent200Response {
  const ReposGetContent200ResponseList(this.value);

  final List<ContentDirectoryInner> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetContent200ResponseList && value == other.value;
  }
}

@immutable
final class ReposGetContent200ResponseContentFile
    extends ReposGetContent200Response {
  const ReposGetContent200ResponseContentFile(this.value);

  final ContentFile value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetContent200ResponseContentFile &&
        value == other.value;
  }
}

/// {@template content_symlink}
/// Symlink Content
/// An object describing a symlink
/// {@endtemplate}
@immutable
final class ContentSymlink extends ReposGetContent200Response {
  /// {@macro content_symlink}
  const ContentSymlink({
    required this.target,
    required this.size,
    required this.name,
    required this.path,
    required this.sha,
    required this.url,
    required this.gitUrl,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.links,
  });

  /// Converts a `Map<String, dynamic>` to a [ContentSymlink].
  factory ContentSymlink.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContentSymlink',
      json,
      () => ContentSymlink(
        target: json['target'] as String,
        size: json['size'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        gitUrl: maybeParseUri(checkedKey(json, 'git_url') as String?),
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
        downloadUrl: maybeParseUri(checkedKey(json, 'download_url') as String?),
        links: ContentSymlinkLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentSymlink? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentSymlink.fromJson(json);
  }

  String get type => 'symlink';
  final String target;
  final int size;
  final String name;
  final String path;
  final String sha;
  final Uri url;
  final Uri? gitUrl;
  final Uri? htmlUrl;
  final Uri? downloadUrl;
  final ContentSymlinkLinks links;

  /// Converts a [ContentSymlink] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'target': target,
      'size': size,
      'name': name,
      'path': path,
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
    target,
    size,
    name,
    path,
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
    return other is ContentSymlink &&
        target == other.target &&
        size == other.size &&
        name == other.name &&
        path == other.path &&
        sha == other.sha &&
        url == other.url &&
        gitUrl == other.gitUrl &&
        htmlUrl == other.htmlUrl &&
        downloadUrl == other.downloadUrl &&
        links == other.links;
  }
}

/// {@template content_submodule}
/// Submodule Content
/// An object describing a submodule
/// {@endtemplate}
@immutable
final class ContentSubmodule extends ReposGetContent200Response {
  /// {@macro content_submodule}
  const ContentSubmodule({
    required this.submoduleGitUrl,
    required this.size,
    required this.name,
    required this.path,
    required this.sha,
    required this.url,
    required this.gitUrl,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.links,
  });

  /// Converts a `Map<String, dynamic>` to a [ContentSubmodule].
  factory ContentSubmodule.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContentSubmodule',
      json,
      () => ContentSubmodule(
        submoduleGitUrl: Uri.parse(json['submodule_git_url'] as String),
        size: json['size'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        gitUrl: maybeParseUri(checkedKey(json, 'git_url') as String?),
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
        downloadUrl: maybeParseUri(checkedKey(json, 'download_url') as String?),
        links: ContentSubmoduleLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentSubmodule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentSubmodule.fromJson(json);
  }

  String get type => 'submodule';
  final Uri submoduleGitUrl;
  final int size;
  final String name;
  final String path;
  final String sha;
  final Uri url;
  final Uri? gitUrl;
  final Uri? htmlUrl;
  final Uri? downloadUrl;
  final ContentSubmoduleLinks links;

  /// Converts a [ContentSubmodule] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'submodule_git_url': submoduleGitUrl.toString(),
      'size': size,
      'name': name,
      'path': path,
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
    submoduleGitUrl,
    size,
    name,
    path,
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
    return other is ContentSubmodule &&
        submoduleGitUrl == other.submoduleGitUrl &&
        size == other.size &&
        name == other.name &&
        path == other.path &&
        sha == other.sha &&
        url == other.url &&
        gitUrl == other.gitUrl &&
        htmlUrl == other.htmlUrl &&
        downloadUrl == other.downloadUrl &&
        links == other.links;
  }
}
