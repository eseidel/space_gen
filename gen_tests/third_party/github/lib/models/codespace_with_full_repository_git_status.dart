import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespace_with_full_repository_git_status}
/// Details about the codespace's git repository.
/// {@endtemplate}
@immutable
class CodespaceWithFullRepositoryGitStatus {
  /// {@macro codespace_with_full_repository_git_status}
  const CodespaceWithFullRepositoryGitStatus({
    this.ahead,
    this.behind,
    this.hasUnpushedChanges,
    this.hasUncommittedChanges,
    this.ref,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespaceWithFullRepositoryGitStatus].
  factory CodespaceWithFullRepositoryGitStatus.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespaceWithFullRepositoryGitStatus',
      json,
      () => CodespaceWithFullRepositoryGitStatus(
        ahead: json['ahead'] as int?,
        behind: json['behind'] as int?,
        hasUnpushedChanges: json['has_unpushed_changes'] as bool?,
        hasUncommittedChanges: json['has_uncommitted_changes'] as bool?,
        ref: json['ref'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespaceWithFullRepositoryGitStatus? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespaceWithFullRepositoryGitStatus.fromJson(json);
  }

  /// The number of commits the local repository is ahead of the remote.
  /// Example: `0`
  final int? ahead;

  /// The number of commits the local repository is behind the remote.
  /// Example: `0`
  final int? behind;

  /// Whether the local repository has unpushed changes.
  final bool? hasUnpushedChanges;

  /// Whether the local repository has uncommitted changes.
  final bool? hasUncommittedChanges;

  /// The current branch (or SHA if in detached HEAD state) of the local
  /// repository.
  /// Example: `'main'`
  final String? ref;

  /// Converts a [CodespaceWithFullRepositoryGitStatus]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (ahead != null) 'ahead': ahead,
      if (behind != null) 'behind': behind,
      if (hasUnpushedChanges != null)
        'has_unpushed_changes': hasUnpushedChanges,
      if (hasUncommittedChanges != null)
        'has_uncommitted_changes': hasUncommittedChanges,
      if (ref != null) 'ref': ref,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ahead,
    behind,
    hasUnpushedChanges,
    hasUncommittedChanges,
    ref,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespaceWithFullRepositoryGitStatus &&
        ahead == other.ahead &&
        behind == other.behind &&
        hasUnpushedChanges == other.hasUnpushedChanges &&
        hasUncommittedChanges == other.hasUncommittedChanges &&
        ref == other.ref;
  }
}
