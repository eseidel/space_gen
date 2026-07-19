import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_classroom_repository}
/// Simple Classroom Repository
/// A GitHub repository view for Classroom
/// {@endtemplate}
@immutable
class SimpleClassroomRepository {
  /// {@macro simple_classroom_repository}
  const SimpleClassroomRepository({
    required this.id,
    required this.fullName,
    required this.htmlUrl,
    required this.nodeId,
    required this.private,
    required this.defaultBranch,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleClassroomRepository].
  factory SimpleClassroomRepository.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleClassroomRepository',
      json,
      () => SimpleClassroomRepository(
        id: json['id'] as int,
        fullName: json['full_name'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        nodeId: json['node_id'] as String,
        private: json['private'] as bool,
        defaultBranch: json['default_branch'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleClassroomRepository? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleClassroomRepository.fromJson(json);
  }

  /// A unique identifier of the repository.
  /// Example: `1296269`
  final int id;

  /// The full, globally unique name of the repository.
  /// Example: `'octocat/Hello-World'`
  final String fullName;

  /// The URL to view the repository on GitHub.com.
  /// Example: `'https://github.com/octocat/Hello-World'`
  final Uri htmlUrl;

  /// The GraphQL identifier of the repository.
  /// Example: `'MDEwOlJlcG9zaXRvcnkxMjk2MjY5'`
  final String nodeId;

  /// Whether the repository is private.
  final bool private;

  /// The default branch for the repository.
  /// Example: `'main'`
  final String defaultBranch;

  /// Converts a [SimpleClassroomRepository] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'html_url': htmlUrl.toString(),
      'node_id': nodeId,
      'private': private,
      'default_branch': defaultBranch,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, fullName, htmlUrl, nodeId, private, defaultBranch]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleClassroomRepository &&
        id == other.id &&
        fullName == other.fullName &&
        htmlUrl == other.htmlUrl &&
        nodeId == other.nodeId &&
        private == other.private &&
        defaultBranch == other.defaultBranch;
  }
}
