import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:discord/models/block_message_action_metadata_1.dart';
import 'package:meta/meta.dart';

@immutable
class BlockMessageAction {
  const BlockMessageAction({this.metadata});

  /// Converts a `Map<String, dynamic>` to a [BlockMessageAction].
  factory BlockMessageAction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BlockMessageAction',
      json,
      () => BlockMessageAction(
        metadata: BlockMessageActionMetadata1.maybeFromJson(
          json['metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BlockMessageAction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BlockMessageAction.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.blockMessage;
  final BlockMessageActionMetadata1? metadata;

  /// Converts a [BlockMessageAction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata?.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockMessageAction && metadata == other.metadata;
  }
}
