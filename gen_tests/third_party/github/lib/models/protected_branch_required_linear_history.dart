import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchRequiredLinearHistory {
  const ProtectedBranchRequiredLinearHistory({required this.enabled});

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredLinearHistory].
  factory ProtectedBranchRequiredLinearHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredLinearHistory',
      json,
      () => ProtectedBranchRequiredLinearHistory(
        enabled: json['enabled'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchRequiredLinearHistory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredLinearHistory.fromJson(json);
  }

  final bool enabled;

  /// Converts a [ProtectedBranchRequiredLinearHistory]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchRequiredLinearHistory &&
        enabled == other.enabled;
  }
}
