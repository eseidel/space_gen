// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class MlSpamUpsertRequestPartialActionsInner {
  const MlSpamUpsertRequestPartialActionsInner();

  factory MlSpamUpsertRequestPartialActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => MlSpamUpsertRequestPartialActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => MlSpamUpsertRequestPartialActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => MlSpamUpsertRequestPartialActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 =>
        MlSpamUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
          UserCommunicationDisabledAction.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MlSpamUpsertRequestPartialActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamUpsertRequestPartialActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MlSpamUpsertRequestPartialActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MlSpamUpsertRequestPartialActionsInnerBlockMessageAction
    extends MlSpamUpsertRequestPartialActionsInner {
  const MlSpamUpsertRequestPartialActionsInnerBlockMessageAction(this.value);

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequestPartialActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestPartialActionsInnerFlagToChannelAction
    extends MlSpamUpsertRequestPartialActionsInner {
  const MlSpamUpsertRequestPartialActionsInnerFlagToChannelAction(this.value);

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequestPartialActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestPartialActionsInnerQuarantineUserAction
    extends MlSpamUpsertRequestPartialActionsInner {
  const MlSpamUpsertRequestPartialActionsInnerQuarantineUserAction(this.value);

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MlSpamUpsertRequestPartialActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestPartialActionsInnerUserCommunicationDisabledAction
    extends MlSpamUpsertRequestPartialActionsInner {
  const MlSpamUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
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
            is MlSpamUpsertRequestPartialActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
