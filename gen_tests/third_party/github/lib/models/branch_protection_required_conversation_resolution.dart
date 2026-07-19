import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchProtectionRequiredConversationResolution {
  const BranchProtectionRequiredConversationResolution({this.enabled});

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchProtectionRequiredConversationResolution].
  factory BranchProtectionRequiredConversationResolution.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchProtectionRequiredConversationResolution',
      json,
      () => BranchProtectionRequiredConversationResolution(
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtectionRequiredConversationResolution? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchProtectionRequiredConversationResolution.fromJson(json);
  }

  final bool? enabled;

  /// Converts a [BranchProtectionRequiredConversationResolution]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': ?enabled};
  }

  @override
  int get hashCode => enabled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtectionRequiredConversationResolution &&
        enabled == other.enabled;
  }
}
