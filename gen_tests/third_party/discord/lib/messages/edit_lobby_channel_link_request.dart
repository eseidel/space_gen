import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class EditLobbyChannelLinkRequest {
  const EditLobbyChannelLinkRequest({this.channelId});

  /// Converts a `Map<String, dynamic>` to an [EditLobbyChannelLinkRequest].
  factory EditLobbyChannelLinkRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EditLobbyChannelLinkRequest',
      json,
      () => EditLobbyChannelLinkRequest(
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EditLobbyChannelLinkRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EditLobbyChannelLinkRequest.fromJson(json);
  }

  final SnowflakeType? channelId;

  /// Converts an [EditLobbyChannelLinkRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId?.toJson()};
  }

  @override
  int get hashCode => channelId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EditLobbyChannelLinkRequest && channelId == other.channelId;
  }
}
