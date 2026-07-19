import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchBlockCreations {
  const ProtectedBranchBlockCreations({required this.enabled});

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchBlockCreations].
  factory ProtectedBranchBlockCreations.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchBlockCreations',
      json,
      () => ProtectedBranchBlockCreations(enabled: json['enabled'] as bool),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchBlockCreations? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchBlockCreations.fromJson(json);
  }

  final bool enabled;

  /// Converts a [ProtectedBranchBlockCreations] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchBlockCreations && enabled == other.enabled;
  }
}
