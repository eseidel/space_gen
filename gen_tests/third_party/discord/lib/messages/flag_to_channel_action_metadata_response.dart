import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class FlagToChannelActionMetadataResponse {
  const FlagToChannelActionMetadataResponse({required this.channelId});

  /// Converts a `Map<String, dynamic>` to a
  /// [FlagToChannelActionMetadataResponse].
  factory FlagToChannelActionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'FlagToChannelActionMetadataResponse',
      json,
      () => FlagToChannelActionMetadataResponse(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FlagToChannelActionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FlagToChannelActionMetadataResponse.fromJson(json);
  }

  final SnowflakeType channelId;

  /// Converts a [FlagToChannelActionMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId.toJson()};
  }

  @override
  int get hashCode => channelId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlagToChannelActionMetadataResponse &&
        channelId == other.channelId;
  }
}
