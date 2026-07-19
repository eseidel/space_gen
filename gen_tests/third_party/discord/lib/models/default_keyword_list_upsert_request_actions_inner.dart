// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class DefaultKeywordListUpsertRequestActionsInner {
  const DefaultKeywordListUpsertRequestActionsInner();

  factory DefaultKeywordListUpsertRequestActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => DefaultKeywordListUpsertRequestActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 => DefaultKeywordListUpsertRequestActionsInnerFlagToChannelAction(
        FlagToChannelAction.fromJson(json),
      ),
      4 => DefaultKeywordListUpsertRequestActionsInnerQuarantineUserAction(
        QuarantineUserAction.fromJson(json),
      ),
      3 =>
        DefaultKeywordListUpsertRequestActionsInnerUserCommunicationDisabledAction(
          UserCommunicationDisabledAction.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for DefaultKeywordListUpsertRequestActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultKeywordListUpsertRequestActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultKeywordListUpsertRequestActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class DefaultKeywordListUpsertRequestActionsInnerBlockMessageAction
    extends DefaultKeywordListUpsertRequestActionsInner {
  const DefaultKeywordListUpsertRequestActionsInnerBlockMessageAction(
    this.value,
  );

  final BlockMessageAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is DefaultKeywordListUpsertRequestActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestActionsInnerFlagToChannelAction
    extends DefaultKeywordListUpsertRequestActionsInner {
  const DefaultKeywordListUpsertRequestActionsInnerFlagToChannelAction(
    this.value,
  );

  final FlagToChannelAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is DefaultKeywordListUpsertRequestActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestActionsInnerQuarantineUserAction
    extends DefaultKeywordListUpsertRequestActionsInner {
  const DefaultKeywordListUpsertRequestActionsInnerQuarantineUserAction(
    this.value,
  );

  final QuarantineUserAction value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is DefaultKeywordListUpsertRequestActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestActionsInnerUserCommunicationDisabledAction
    extends DefaultKeywordListUpsertRequestActionsInner {
  const DefaultKeywordListUpsertRequestActionsInnerUserCommunicationDisabledAction(
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
            is DefaultKeywordListUpsertRequestActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
