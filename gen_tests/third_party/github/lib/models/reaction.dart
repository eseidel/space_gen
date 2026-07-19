import 'package:github/model_helpers.dart';
import 'package:github/models/reaction_content.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template reaction}
/// Reaction
/// Reactions to conversations provide a way to help people express their
/// feelings more simply and effectively.
/// {@endtemplate}
@immutable
class Reaction {
  /// {@macro reaction}
  const Reaction({
    required this.id,
    required this.nodeId,
    required this.user,
    required this.content,
    required this.createdAt,
  });

  /// Converts a `Map<String, dynamic>` to a [Reaction].
  factory Reaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Reaction',
      json,
      () => Reaction(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        content: ReactionContent.fromJson(json['content'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Reaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Reaction.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'MDg6UmVhY3Rpb24x'`
  final String nodeId;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// The reaction to use
  /// Example: `'heart'`
  final ReactionContent content;

  /// Example: `'2016-05-20T20:09:31Z'`
  final DateTime createdAt;

  /// Converts a [Reaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'user': user?.toJson(),
      'content': content.toJson(),
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, nodeId, user, content, createdAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Reaction &&
        id == other.id &&
        nodeId == other.nodeId &&
        user == other.user &&
        content == other.content &&
        createdAt == other.createdAt;
  }
}
