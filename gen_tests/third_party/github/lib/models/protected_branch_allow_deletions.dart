// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchAllowDeletions {
  const ProtectedBranchAllowDeletions({required this.enabled});

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchAllowDeletions].
  factory ProtectedBranchAllowDeletions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchAllowDeletions',
      json,
      () => ProtectedBranchAllowDeletions(enabled: json['enabled'] as bool),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchAllowDeletions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchAllowDeletions.fromJson(json);
  }

  final bool enabled;

  /// Converts a [ProtectedBranchAllowDeletions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchAllowDeletions && enabled == other.enabled;
  }
}
