import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class MlSpamUpsertRequestActionsInner {
  const MlSpamUpsertRequestActionsInner();

  factory MlSpamUpsertRequestActionsInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => MlSpamUpsertRequestActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => MlSpamUpsertRequestActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => MlSpamUpsertRequestActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 => MlSpamUpsertRequestActionsInnerUserCommunicationDisabledAction(
        UserCommunicationDisabledAction.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MlSpamUpsertRequestActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MlSpamUpsertRequestActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MlSpamUpsertRequestActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MlSpamUpsertRequestActionsInnerBlockMessageAction
    extends MlSpamUpsertRequestActionsInner {
  const MlSpamUpsertRequestActionsInnerBlockMessageAction(this.value);

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequestActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestActionsInnerFlagToChannelAction
    extends MlSpamUpsertRequestActionsInner {
  const MlSpamUpsertRequestActionsInnerFlagToChannelAction(this.value);

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequestActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestActionsInnerQuarantineUserAction
    extends MlSpamUpsertRequestActionsInner {
  const MlSpamUpsertRequestActionsInnerQuarantineUserAction(this.value);

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MlSpamUpsertRequestActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class MlSpamUpsertRequestActionsInnerUserCommunicationDisabledAction
    extends MlSpamUpsertRequestActionsInner {
  const MlSpamUpsertRequestActionsInnerUserCommunicationDisabledAction(
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
            is MlSpamUpsertRequestActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
