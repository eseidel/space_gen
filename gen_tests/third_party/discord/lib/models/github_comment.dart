import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubComment {
  GithubComment({
    required this.id,
    required this.htmlUrl,
    required this.user,
    required this.body,
    this.commitId,
  }) {
    commitId?.validate(maxLength: 152133);
    body.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubComment].
  factory GithubComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubComment',
      json,
      () => GithubComment(
        id: json['id'] as int,
        htmlUrl: Uri.parse(json['html_url'] as String),
        user: GithubUser.fromJson(json['user'] as Map<String, dynamic>),
        commitId: json['commit_id'] as String?,
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubComment.fromJson(json);
  }

  final int id;
  final Uri htmlUrl;
  final GithubUser user;
  final String? commitId;
  final String body;

  /// Converts a [GithubComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'html_url': htmlUrl.toString(),
      'user': user.toJson(),
      'commit_id': commitId,
      'body': body,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, htmlUrl, user, commitId, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubComment &&
        id == other.id &&
        htmlUrl == other.htmlUrl &&
        user == other.user &&
        commitId == other.commitId &&
        body == other.body;
  }
}
