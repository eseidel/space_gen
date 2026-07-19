import 'package:discord/messages/block_message_action_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:meta/meta.dart';

@immutable
class BlockMessageActionResponse {
  const BlockMessageActionResponse({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a [BlockMessageActionResponse].
  factory BlockMessageActionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BlockMessageActionResponse',
      json,
      () => BlockMessageActionResponse(
        metadata: BlockMessageActionMetadataResponse.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BlockMessageActionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BlockMessageActionResponse.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.blockMessage;
  final BlockMessageActionMetadataResponse metadata;

  /// Converts a [BlockMessageActionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockMessageActionResponse && metadata == other.metadata;
  }
}
