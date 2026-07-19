import 'package:discord/messages/flag_to_channel_action_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:meta/meta.dart';

@immutable
class FlagToChannelActionResponse {
  const FlagToChannelActionResponse({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a [FlagToChannelActionResponse].
  factory FlagToChannelActionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FlagToChannelActionResponse',
      json,
      () => FlagToChannelActionResponse(
        metadata: FlagToChannelActionMetadataResponse.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FlagToChannelActionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FlagToChannelActionResponse.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.flagToChannel;
  final FlagToChannelActionMetadataResponse metadata;

  /// Converts a [FlagToChannelActionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlagToChannelActionResponse && metadata == other.metadata;
  }
}
