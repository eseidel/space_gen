import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchProtectionAllowDeletions {
  const BranchProtectionAllowDeletions({this.enabled});

  /// Converts a `Map<String, dynamic>` to a [BranchProtectionAllowDeletions].
  factory BranchProtectionAllowDeletions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchProtectionAllowDeletions',
      json,
      () => BranchProtectionAllowDeletions(enabled: json['enabled'] as bool?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtectionAllowDeletions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchProtectionAllowDeletions.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [BranchProtectionAllowDeletions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': ?enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtectionAllowDeletions && enabled == other.enabled;
  }
}
