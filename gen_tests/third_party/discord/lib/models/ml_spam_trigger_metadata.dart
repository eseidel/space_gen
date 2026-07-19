import 'package:meta/meta.dart';

@immutable
class MlSpamTriggerMetadata {
  const MlSpamTriggerMetadata();

  /// Converts a `Map<String, dynamic>` to a [MlSpamTriggerMetadata].
  factory MlSpamTriggerMetadata.fromJson(Map<String, dynamic> _) {
    return const MlSpamTriggerMetadata();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamTriggerMetadata? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MlSpamTriggerMetadata.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
