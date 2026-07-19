// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/block_message_action_response.dart';
import 'package:discord/messages/flag_to_channel_action_response.dart';
import 'package:discord/messages/quarantine_user_action_response.dart';
import 'package:discord/messages/user_communication_disabled_action_response.dart';
import 'package:meta/meta.dart';

sealed class DefaultKeywordRuleResponseActionsInner {
  const DefaultKeywordRuleResponseActionsInner();

  factory DefaultKeywordRuleResponseActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => DefaultKeywordRuleResponseActionsInnerBlockMessageActionResponse(
        BlockMessageActionResponse.fromJson(json),
      ),
      2 => DefaultKeywordRuleResponseActionsInnerFlagToChannelActionResponse(
        FlagToChannelActionResponse.fromJson(json),
      ),
      4 => DefaultKeywordRuleResponseActionsInnerQuarantineUserActionResponse(
        QuarantineUserActionResponse.fromJson(json),
      ),
      3 =>
        DefaultKeywordRuleResponseActionsInnerUserCommunicationDisabledActionResponse(
          UserCommunicationDisabledActionResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for DefaultKeywordRuleResponseActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultKeywordRuleResponseActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultKeywordRuleResponseActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class DefaultKeywordRuleResponseActionsInnerBlockMessageActionResponse
    extends DefaultKeywordRuleResponseActionsInner {
  const DefaultKeywordRuleResponseActionsInnerBlockMessageActionResponse(
    this.value,
  );

  final BlockMessageActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is DefaultKeywordRuleResponseActionsInnerBlockMessageActionResponse &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordRuleResponseActionsInnerFlagToChannelActionResponse
    extends DefaultKeywordRuleResponseActionsInner {
  const DefaultKeywordRuleResponseActionsInnerFlagToChannelActionResponse(
    this.value,
  );

  final FlagToChannelActionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is DefaultKeywordRuleResponseActionsInnerFlagToChannelActionResponse &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordRuleResponseActionsInnerQuarantineUserActionResponse
    extends DefaultKeywordRuleResponseActionsInner {
  const DefaultKeywordRuleResponseActionsInnerQuarantineUserActionResponse(
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
            is DefaultKeywordRuleResponseActionsInnerQuarantineUserActionResponse &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordRuleResponseActionsInnerUserCommunicationDisabledActionResponse
    extends DefaultKeywordRuleResponseActionsInner {
  const DefaultKeywordRuleResponseActionsInnerUserCommunicationDisabledActionResponse(
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
            is DefaultKeywordRuleResponseActionsInnerUserCommunicationDisabledActionResponse &&
        value == other.value;
  }
}
