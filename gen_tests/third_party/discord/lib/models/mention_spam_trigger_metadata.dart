import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MentionSpamTriggerMetadata {
  MentionSpamTriggerMetadata({
    this.mentionTotalLimit,
    this.mentionRaidProtectionEnabled,
  }) {
    mentionTotalLimit?.validate(min: 0, max: 50);
  }

  /// Converts a `Map<String, dynamic>` to a [MentionSpamTriggerMetadata].
  factory MentionSpamTriggerMetadata.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MentionSpamTriggerMetadata',
      json,
      () => MentionSpamTriggerMetadata(
        mentionTotalLimit: json['mention_total_limit'] as int?,
        mentionRaidProtectionEnabled:
            json['mention_raid_protection_enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionSpamTriggerMetadata? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MentionSpamTriggerMetadata.fromJson(json);
  }

  final int? mentionTotalLimit;
  final bool? mentionRaidProtectionEnabled;

  /// Converts a [MentionSpamTriggerMetadata] to a `Map<String, dynamic>`.
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
    return other is MentionSpamTriggerMetadata &&
        mentionTotalLimit == other.mentionTotalLimit &&
        mentionRaidProtectionEnabled == other.mentionRaidProtectionEnabled;
  }
}
