import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_classroom_organization}
/// Organization Simple for Classroom
/// A GitHub organization.
/// {@endtemplate}
@immutable
class SimpleClassroomOrganization {
  /// {@macro simple_classroom_organization}
  const SimpleClassroomOrganization({
    required this.id,
    required this.login,
    required this.nodeId,
    required this.htmlUrl,
    required this.name,
    required this.avatarUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleClassroomOrganization].
  factory SimpleClassroomOrganization.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleClassroomOrganization',
      json,
      () => SimpleClassroomOrganization(
        id: json['id'] as int,
        login: json['login'] as String,
        nodeId: json['node_id'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        name: checkedKey(json, 'name') as String?,
        avatarUrl: json['avatar_url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleClassroomOrganization? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SimpleClassroomOrganization.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'github'`
  final String login;

  /// Example: `'MDEyOk9yZ2FuaXphdGlvbjE='`
  final String nodeId;

  /// Example: `'https://github.com/github'`
  final Uri htmlUrl;

  /// Example: `'Github - Code thigns happen here'`
  final String? name;

  /// Example: `'https://github.com/images/error/octocat_happy.gif'`
  final String avatarUrl;

  /// Converts a [SimpleClassroomOrganization] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'node_id': nodeId,
      'html_url': htmlUrl.toString(),
      'name': name,
      'avatar_url': avatarUrl,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, login, nodeId, htmlUrl, name, avatarUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleClassroomOrganization &&
        id == other.id &&
        login == other.login &&
        nodeId == other.nodeId &&
        htmlUrl == other.htmlUrl &&
        name == other.name &&
        avatarUrl == other.avatarUrl;
  }
}
