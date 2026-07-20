import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_author.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCommit {
  GithubCommit({
    required this.id,
    required this.url,
    required this.message,
    required this.author,
  }) {
    id.validate(maxLength: 152133);
    message.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubCommit].
  factory GithubCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCommit',
      json,
      () => GithubCommit(
        id: json['id'] as String,
        url: Uri.parse(json['url'] as String),
        message: json['message'] as String,
        author: GithubAuthor.fromJson(json['author'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCommit.fromJson(json);
  }

  final String id;
  final Uri url;
  final String message;
  final GithubAuthor author;

  /// Converts a [GithubCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url.toString(),
      'message': message,
      'author': author.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, url, message, author]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCommit &&
        id == other.id &&
        url == other.url &&
        message == other.message &&
        author == other.author;
  }
}
