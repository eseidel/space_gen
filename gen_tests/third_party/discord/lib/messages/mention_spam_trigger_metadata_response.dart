import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MentionSpamTriggerMetadataResponse {
  const MentionSpamTriggerMetadataResponse({
    required this.mentionTotalLimit,
    required this.mentionRaidProtectionEnabled,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MentionSpamTriggerMetadataResponse].
  factory MentionSpamTriggerMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MentionSpamTriggerMetadataResponse',
      json,
      () => MentionSpamTriggerMetadataResponse(
        mentionTotalLimit: json['mention_total_limit'] as int,
        mentionRaidProtectionEnabled:
            json['mention_raid_protection_enabled'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionSpamTriggerMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionSpamTriggerMetadataResponse.fromJson(json);
  }

  final int mentionTotalLimit;
  final bool mentionRaidProtectionEnabled;

  /// Converts a [MentionSpamTriggerMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'mention_total_limit': mentionTotalLimit,
      'mention_raid_protection_enabled': mentionRaidProtectionEnabled,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([mentionTotalLimit, mentionRaidProtectionEnabled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionSpamTriggerMetadataResponse &&
        mentionTotalLimit == other.mentionTotalLimit &&
        mentionRaidProtectionEnabled == other.mentionRaidProtectionEnabled;
  }
}
