import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class FlagToChannelActionMetadata {
  const FlagToChannelActionMetadata({required this.channelId});

  /// Converts a `Map<String, dynamic>` to a [FlagToChannelActionMetadata].
  factory FlagToChannelActionMetadata.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FlagToChannelActionMetadata',
      json,
      () => FlagToChannelActionMetadata(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FlagToChannelActionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FlagToChannelActionMetadata.fromJson(json);
  }

  final SnowflakeType channelId;

  /// Converts a [FlagToChannelActionMetadata] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId.toJson()};
  }

  @override
  int get hashCode => channelId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlagToChannelActionMetadata && channelId == other.channelId;
  }
}
