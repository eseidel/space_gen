import 'package:github/model_helpers.dart';
import 'package:github/models/simple_commit_author.dart';
import 'package:github/models/simple_commit_committer.dart';
import 'package:meta/meta.dart';

/// {@template simple_commit}
/// Simple Commit
/// A commit.
/// {@endtemplate}
@immutable
class SimpleCommit {
  /// {@macro simple_commit}
  const SimpleCommit({
    required this.id,
    required this.treeId,
    required this.message,
    required this.timestamp,
    required this.author,
    required this.committer,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleCommit].
  factory SimpleCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleCommit',
      json,
      () => SimpleCommit(
        id: json['id'] as String,
        treeId: json['tree_id'] as String,
        message: json['message'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        author: SimpleCommitAuthor.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        committer: SimpleCommitCommitter.maybeFromJson(
          checkedKey(json, 'committer') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleCommit.fromJson(json);
  }

  /// SHA for the commit
  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String id;

  /// SHA for the commit's tree
  final String treeId;

  /// Message describing the purpose of the commit
  /// Example: `'Fix #42'`
  final String message;

  /// Timestamp of the commit
  /// Example: `'2014-08-09T08:02:04+12:00'`
  final DateTime timestamp;

  /// Information about the Git author
  final SimpleCommitAuthor? author;

  /// Information about the Git committer
  final SimpleCommitCommitter? committer;

  /// Converts a [SimpleCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tree_id': treeId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'author': author?.toJson(),
      'committer': committer?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, treeId, message, timestamp, author, committer]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleCommit &&
        id == other.id &&
        treeId == other.treeId &&
        message == other.message &&
        timestamp == other.timestamp &&
        author == other.author &&
        committer == other.committer;
  }
}
