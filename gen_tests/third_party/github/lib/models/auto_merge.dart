import 'package:github/model_helpers.dart';
import 'package:github/models/auto_merge_merge_method.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template auto_merge}
/// Auto merge
/// The status of auto merging a pull request.
/// {@endtemplate}
@immutable
class AutoMerge {
  /// {@macro auto_merge}
  const AutoMerge({
    required this.enabledBy,
    required this.mergeMethod,
    required this.commitTitle,
    required this.commitMessage,
  });

  /// Converts a `Map<String, dynamic>` to an [AutoMerge].
  factory AutoMerge.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AutoMerge',
      json,
      () => AutoMerge(
        enabledBy: SimpleUser.fromJson(
          json['enabled_by'] as Map<String, dynamic>,
        ),
        mergeMethod: AutoMergeMergeMethod.fromJson(
          json['merge_method'] as String,
        ),
        commitTitle: json['commit_title'] as String,
        commitMessage: json['commit_message'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AutoMerge? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AutoMerge.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser enabledBy;

  /// The merge method to use.
  final AutoMergeMergeMethod mergeMethod;

  /// Title for the merge commit message.
  final String commitTitle;

  /// Commit message for the merge commit.
  final String commitMessage;

  /// Converts an [AutoMerge] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'enabled_by': enabledBy.toJson(),
      'merge_method': mergeMethod.toJson(),
      'commit_title': commitTitle,
      'commit_message': commitMessage,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([enabledBy, mergeMethod, commitTitle, commitMessage]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AutoMerge &&
        enabledBy == other.enabledBy &&
        mergeMethod == other.mergeMethod &&
        commitTitle == other.commitTitle &&
        commitMessage == other.commitMessage;
  }
}
