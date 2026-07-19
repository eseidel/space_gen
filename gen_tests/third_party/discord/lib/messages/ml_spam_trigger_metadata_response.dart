import 'package:meta/meta.dart';

@immutable
class MlSpamTriggerMetadataResponse {
  const MlSpamTriggerMetadataResponse();

  /// Converts a `Map<String, dynamic>` to a [MlSpamTriggerMetadataResponse].
  factory MlSpamTriggerMetadataResponse.fromJson(Map<String, dynamic> _) {
    return const MlSpamTriggerMetadataResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamTriggerMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MlSpamTriggerMetadataResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
