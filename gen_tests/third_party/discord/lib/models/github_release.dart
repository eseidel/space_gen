import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubRelease {
  const GithubRelease({
    required this.id,
    required this.tagName,
    required this.htmlUrl,
    required this.author,
  });

  /// Converts a `Map<String, dynamic>` to a [GithubRelease].
  factory GithubRelease.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubRelease',
      json,
      () => GithubRelease(
        id: json['id'] as int,
        tagName: json['tag_name'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        author: GithubUser.fromJson(json['author'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubRelease? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubRelease.fromJson(json);
  }

  final int id;
  final String tagName;
  final Uri htmlUrl;
  final GithubUser author;

  /// Converts a [GithubRelease] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag_name': tagName,
      'html_url': htmlUrl.toString(),
      'author': author.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, tagName, htmlUrl, author]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubRelease &&
        id == other.id &&
        tagName == other.tagName &&
        htmlUrl == other.htmlUrl &&
        author == other.author;
  }
}
