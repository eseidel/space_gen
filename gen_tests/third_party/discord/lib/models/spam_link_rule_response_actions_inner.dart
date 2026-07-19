// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/block_message_action_response.dart';
import 'package:discord/messages/flag_to_channel_action_response.dart';
import 'package:discord/messages/quarantine_user_action_response.dart';
import 'package:discord/messages/user_communication_disabled_action_response.dart';
import 'package:meta/meta.dart';

sealed class SpamLinkRuleResponseActionsInner {
  const SpamLinkRuleResponseActionsInner();

  factory SpamLinkRuleResponseActionsInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => SpamLinkRuleResponseActionsInnerBlockMessageActionResponse(
        BlockMessageActionResponse.fromJson(json),
      ),
      2 => SpamLinkRuleResponseActionsInnerFlagToChannelActionResponse(
        FlagToChannelActionResponse.fromJson(json),
      ),
      4 => SpamLinkRuleResponseActionsInnerQuarantineUserActionResponse(
        QuarantineUserActionResponse.fromJson(json),
      ),
      3 =>
        SpamLinkRuleResponseActionsInnerUserCommunicationDisabledActionResponse(
          UserCommunicationDisabledActionResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SpamLinkRuleResponseActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SpamLinkRuleResponseActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SpamLinkRuleResponseActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SpamLinkRuleResponseActionsInnerBlockMessageActionResponse
    extends SpamLinkRuleResponseActionsInner {
  const SpamLinkRuleResponseActionsInnerBlockMessageActionResponse(this.value);

  final BlockMessageActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SpamLinkRuleResponseActionsInnerBlockMessageActionResponse &&
        value == other.value;
  }
}

@immutable
final class SpamLinkRuleResponseActionsInnerFlagToChannelActionResponse
    extends SpamLinkRuleResponseActionsInner {
  const SpamLinkRuleResponseActionsInnerFlagToChannelActionResponse(this.value);

  final FlagToChannelActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SpamLinkRuleResponseActionsInnerFlagToChannelActionResponse &&
        value == other.value;
  }
}

@immutable
final class SpamLinkRuleResponseActionsInnerQuarantineUserActionResponse
    extends SpamLinkRuleResponseActionsInner {
  const SpamLinkRuleResponseActionsInnerQuarantineUserActionResponse(
    this.value,
  );

  final QuarantineUserActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SpamLinkRuleResponseActionsInnerQuarantineUserActionResponse &&
        value == other.value;
  }
}

@immutable
final class SpamLinkRuleResponseActionsInnerUserCommunicationDisabledActionResponse
    extends SpamLinkRuleResponseActionsInner {
  const SpamLinkRuleResponseActionsInnerUserCommunicationDisabledActionResponse(
    this.value,
  );

  final UserCommunicationDisabledActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SpamLinkRuleResponseActionsInnerUserCommunicationDisabledActionResponse &&
        value == other.value;
  }
}
