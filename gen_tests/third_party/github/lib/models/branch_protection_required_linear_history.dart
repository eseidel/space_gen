import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchProtectionRequiredLinearHistory {
  const BranchProtectionRequiredLinearHistory({this.enabled});

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchProtectionRequiredLinearHistory].
  factory BranchProtectionRequiredLinearHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchProtectionRequiredLinearHistory',
      json,
      () => BranchProtectionRequiredLinearHistory(
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtectionRequiredLinearHistory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchProtectionRequiredLinearHistory.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [BranchProtectionRequiredLinearHistory]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (enabled != null) 'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtectionRequiredLinearHistory &&
        enabled == other.enabled;
  }
}
