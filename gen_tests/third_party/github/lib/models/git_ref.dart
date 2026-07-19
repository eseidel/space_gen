import 'package:github/model_helpers.dart';
import 'package:github/models/git_ref_object.dart';
import 'package:meta/meta.dart';

/// {@template git_ref}
/// Git Reference
/// Git references within a repository
/// {@endtemplate}
@immutable
class GitRef {
  /// {@macro git_ref}
  const GitRef({
    required this.ref,
    required this.nodeId,
    required this.url,
    required this.object,
  });

  /// Converts a `Map<String, dynamic>` to a [GitRef].
  factory GitRef.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitRef',
      json,
      () => GitRef(
        ref: json['ref'] as String,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        object: GitRefObject.fromJson(json['object'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitRef? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitRef.fromJson(json);
  }

  final String ref;
  final String nodeId;
  final Uri url;
  final GitRefObject object;

  /// Converts a [GitRef] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ref': ref,
      'node_id': nodeId,
      'url': url.toString(),
      'object': object.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([ref, nodeId, url, object]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitRef &&
        ref == other.ref &&
        nodeId == other.nodeId &&
        url == other.url &&
        object == other.object;
  }
}
