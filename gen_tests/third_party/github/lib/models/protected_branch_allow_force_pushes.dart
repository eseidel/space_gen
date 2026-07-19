import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchAllowForcePushes {
  const ProtectedBranchAllowForcePushes({required this.enabled});

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchAllowForcePushes].
  factory ProtectedBranchAllowForcePushes.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchAllowForcePushes',
      json,
      () => ProtectedBranchAllowForcePushes(enabled: json['enabled'] as bool),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchAllowForcePushes? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchAllowForcePushes.fromJson(json);
  }

  final bool enabled;

  /// Converts a [ProtectedBranchAllowForcePushes] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchAllowForcePushes && enabled == other.enabled;
  }
}
