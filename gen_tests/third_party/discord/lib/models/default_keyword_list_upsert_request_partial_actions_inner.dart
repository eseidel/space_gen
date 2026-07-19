// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/block_message_action.dart';
import 'package:discord/models/flag_to_channel_action.dart';
import 'package:discord/models/quarantine_user_action.dart';
import 'package:discord/models/user_communication_disabled_action.dart';
import 'package:meta/meta.dart';

sealed class DefaultKeywordListUpsertRequestPartialActionsInner {
  const DefaultKeywordListUpsertRequestPartialActionsInner();

  factory DefaultKeywordListUpsertRequestPartialActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => DefaultKeywordListUpsertRequestPartialActionsInnerBlockMessageAction(
        BlockMessageAction.fromJson(json),
      ),
      2 =>
        DefaultKeywordListUpsertRequestPartialActionsInnerFlagToChannelAction(
          FlagToChannelAction.fromJson(json),
        ),
      4 =>
        DefaultKeywordListUpsertRequestPartialActionsInnerQuarantineUserAction(
          QuarantineUserAction.fromJson(json),
        ),
      3 =>
        DefaultKeywordListUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
          UserCommunicationDisabledAction.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for DefaultKeywordListUpsertRequestPartialActionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultKeywordListUpsertRequestPartialActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultKeywordListUpsertRequestPartialActionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class DefaultKeywordListUpsertRequestPartialActionsInnerBlockMessageAction
    extends DefaultKeywordListUpsertRequestPartialActionsInner {
  const DefaultKeywordListUpsertRequestPartialActionsInnerBlockMessageAction(
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
            is DefaultKeywordListUpsertRequestPartialActionsInnerBlockMessageAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestPartialActionsInnerFlagToChannelAction
    extends DefaultKeywordListUpsertRequestPartialActionsInner {
  const DefaultKeywordListUpsertRequestPartialActionsInnerFlagToChannelAction(
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
            is DefaultKeywordListUpsertRequestPartialActionsInnerFlagToChannelAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestPartialActionsInnerQuarantineUserAction
    extends DefaultKeywordListUpsertRequestPartialActionsInner {
  const DefaultKeywordListUpsertRequestPartialActionsInnerQuarantineUserAction(
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
            is DefaultKeywordListUpsertRequestPartialActionsInnerQuarantineUserAction &&
        value == other.value;
  }
}

@immutable
final class DefaultKeywordListUpsertRequestPartialActionsInnerUserCommunicationDisabledAction
    extends DefaultKeywordListUpsertRequestPartialActionsInner {
  const DefaultKeywordListUpsertRequestPartialActionsInnerUserCommunicationDisabledAction(
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
            is DefaultKeywordListUpsertRequestPartialActionsInnerUserCommunicationDisabledAction &&
        value == other.value;
  }
}
