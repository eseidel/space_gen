// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class KeywordUpsertRequestActionsInner {
  const KeywordUpsertRequestActionsInner();

  factory KeywordUpsertRequestActionsInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => KeywordUpsertRequestActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => KeywordUpsertRequestActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => KeywordUpsertRequestActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 => KeywordUpsertRequestActionsInnerUserCommunicationDisabledAction(
        UserCommunicationDisabledAction.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for KeywordUpsertRequestActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordUpsertRequestActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return KeywordUpsertRequestActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class KeywordUpsertRequestActionsInnerBlockMessageAction
    extends KeywordUpsertRequestActionsInner {
  const KeywordUpsertRequestActionsInnerBlockMessageAction(this.value);

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequestActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestActionsInnerFlagToChannelAction
    extends KeywordUpsertRequestActionsInner {
  const KeywordUpsertRequestActionsInnerFlagToChannelAction(this.value);

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequestActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestActionsInnerQuarantineUserAction
    extends KeywordUpsertRequestActionsInner {
  const KeywordUpsertRequestActionsInnerQuarantineUserAction(this.value);

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequestActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestActionsInnerUserCommunicationDisabledAction
    extends KeywordUpsertRequestActionsInner {
  const KeywordUpsertRequestActionsInnerUserCommunicationDisabledAction(
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
            is KeywordUpsertRequestActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
