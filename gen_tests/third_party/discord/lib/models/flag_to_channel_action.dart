import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:discord/models/flag_to_channel_action_metadata.dart';
import 'package:meta/meta.dart';

@immutable
class FlagToChannelAction {
  const FlagToChannelAction({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a [FlagToChannelAction].
  factory FlagToChannelAction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FlagToChannelAction',
      json,
      () => FlagToChannelAction(
        metadata: FlagToChannelActionMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FlagToChannelAction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FlagToChannelAction.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.flagToChannel;
  final FlagToChannelActionMetadata metadata;

  /// Converts a [FlagToChannelAction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlagToChannelAction && metadata == other.metadata;
  }
}
