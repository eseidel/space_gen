import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchProtectionAllowForcePushes {
  const BranchProtectionAllowForcePushes({this.enabled});

  /// Converts a `Map<String, dynamic>` to a [BranchProtectionAllowForcePushes].
  factory BranchProtectionAllowForcePushes.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchProtectionAllowForcePushes',
      json,
      () => BranchProtectionAllowForcePushes(enabled: json['enabled'] as bool?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtectionAllowForcePushes? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchProtectionAllowForcePushes.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [BranchProtectionAllowForcePushes] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (enabled != null) 'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtectionAllowForcePushes &&
        enabled == other.enabled;
  }
}
