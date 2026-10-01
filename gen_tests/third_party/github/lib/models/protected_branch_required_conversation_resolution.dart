// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchRequiredConversationResolution {
  const ProtectedBranchRequiredConversationResolution({this.enabled});

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredConversationResolution].
  factory ProtectedBranchRequiredConversationResolution.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredConversationResolution',
      json,
      () => ProtectedBranchRequiredConversationResolution(
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchRequiredConversationResolution? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredConversationResolution.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [ProtectedBranchRequiredConversationResolution]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': ?enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchRequiredConversationResolution &&
        enabled == other.enabled;
  }
}
