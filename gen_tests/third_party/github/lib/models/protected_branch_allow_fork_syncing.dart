import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch_allow_fork_syncing}
/// Whether users can pull changes from upstream when the branch is locked. Set
/// to `true` to allow fork syncing. Set to `false` to prevent fork syncing.
/// {@endtemplate}
@immutable
class ProtectedBranchAllowForkSyncing {
  /// {@macro protected_branch_allow_fork_syncing}
  const ProtectedBranchAllowForkSyncing({this.enabled = false});

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchAllowForkSyncing].
  factory ProtectedBranchAllowForkSyncing.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchAllowForkSyncing',
      json,
      () => ProtectedBranchAllowForkSyncing(
        enabled: (json['enabled'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchAllowForkSyncing? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchAllowForkSyncing.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [ProtectedBranchAllowForkSyncing] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchAllowForkSyncing && enabled == other.enabled;
  }
}
