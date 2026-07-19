// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class KeywordUpsertRequestPartialActionsInner {
  const KeywordUpsertRequestPartialActionsInner();

  factory KeywordUpsertRequestPartialActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => KeywordUpsertRequestPartialActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => KeywordUpsertRequestPartialActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => KeywordUpsertRequestPartialActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 =>
        KeywordUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
          UserCommunicationDisabledAction.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for KeywordUpsertRequestPartialActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordUpsertRequestPartialActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return KeywordUpsertRequestPartialActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class KeywordUpsertRequestPartialActionsInnerBlockMessageAction
    extends KeywordUpsertRequestPartialActionsInner {
  const KeywordUpsertRequestPartialActionsInnerBlockMessageAction(this.value);

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordUpsertRequestPartialActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestPartialActionsInnerFlagToChannelAction
    extends KeywordUpsertRequestPartialActionsInner {
  const KeywordUpsertRequestPartialActionsInnerFlagToChannelAction(this.value);

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is KeywordUpsertRequestPartialActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestPartialActionsInnerQuarantineUserAction
    extends KeywordUpsertRequestPartialActionsInner {
  const KeywordUpsertRequestPartialActionsInnerQuarantineUserAction(this.value);

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is KeywordUpsertRequestPartialActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class KeywordUpsertRequestPartialActionsInnerUserCommunicationDisabledAction
    extends KeywordUpsertRequestPartialActionsInner {
  const KeywordUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
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
            is KeywordUpsertRequestPartialActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
