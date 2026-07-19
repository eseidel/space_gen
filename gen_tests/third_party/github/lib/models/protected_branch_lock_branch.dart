import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch_lock_branch}
/// Whether to set the branch as read-only. If this is true, users will not be
/// able to push to the branch.
/// {@endtemplate}
@immutable
class ProtectedBranchLockBranch {
  /// {@macro protected_branch_lock_branch}
  const ProtectedBranchLockBranch({this.enabled = false});

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchLockBranch].
  factory ProtectedBranchLockBranch.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchLockBranch',
      json,
      () => ProtectedBranchLockBranch(
        enabled: (json['enabled'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchLockBranch? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchLockBranch.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [ProtectedBranchLockBranch] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchLockBranch && enabled == other.enabled;
  }
}
