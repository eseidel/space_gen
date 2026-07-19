import 'package:meta/meta.dart';

@immutable
class SpamLinkTriggerMetadataResponse {
  const SpamLinkTriggerMetadataResponse();

  /// Converts a `Map<String, dynamic>` to a [SpamLinkTriggerMetadataResponse].
  factory SpamLinkTriggerMetadataResponse.fromJson(Map<String, dynamic> _) {
    return const SpamLinkTriggerMetadataResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SpamLinkTriggerMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SpamLinkTriggerMetadataResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
