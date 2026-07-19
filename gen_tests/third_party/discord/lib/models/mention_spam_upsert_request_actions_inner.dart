// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class MentionSpamUpsertRequestActionsInner {
  const MentionSpamUpsertRequestActionsInner();

  factory MentionSpamUpsertRequestActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => MentionSpamUpsertRequestActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => MentionSpamUpsertRequestActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => MentionSpamUpsertRequestActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 => MentionSpamUpsertRequestActionsInnerUserCommunicationDisabledAction(
        UserCommunicationDisabledAction.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MentionSpamUpsertRequestActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionSpamUpsertRequestActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionSpamUpsertRequestActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MentionSpamUpsertRequestActionsInnerBlockMessageAction
    extends MentionSpamUpsertRequestActionsInner {
  const MentionSpamUpsertRequestActionsInnerBlockMessageAction(this.value);

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionSpamUpsertRequestActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class MentionSpamUpsertRequestActionsInnerFlagToChannelAction
    extends MentionSpamUpsertRequestActionsInner {
  const MentionSpamUpsertRequestActionsInnerFlagToChannelAction(this.value);

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionSpamUpsertRequestActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class MentionSpamUpsertRequestActionsInnerQuarantineUserAction
    extends MentionSpamUpsertRequestActionsInner {
  const MentionSpamUpsertRequestActionsInnerQuarantineUserAction(this.value);

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionSpamUpsertRequestActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class MentionSpamUpsertRequestActionsInnerUserCommunicationDisabledAction
    extends MentionSpamUpsertRequestActionsInner {
  const MentionSpamUpsertRequestActionsInnerUserCommunicationDisabledAction(
    this.value,
  );

  final UserCommunicationDisabledAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MentionSpamUpsertRequestActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
