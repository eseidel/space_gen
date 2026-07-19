import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template branch_protection_lock_branch}
/// Whether to set the branch as read-only. If this is true, users will not be
/// able to push to the branch.
/// {@endtemplate}
@immutable
class BranchProtectionLockBranch {
  /// {@macro branch_protection_lock_branch}
  const BranchProtectionLockBranch({this.enabled = false});

  /// Converts a `Map<String, dynamic>` to a [BranchProtectionLockBranch].
  factory BranchProtectionLockBranch.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchProtectionLockBranch',
      json,
      () => BranchProtectionLockBranch(
        enabled: (json['enabled'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtectionLockBranch? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchProtectionLockBranch.fromJson(json);
  }

  final bool enabled;

  /// Converts a [BranchProtectionLockBranch] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtectionLockBranch && enabled == other.enabled;
  }
}
