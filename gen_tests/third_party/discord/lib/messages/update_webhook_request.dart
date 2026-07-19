import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateWebhookRequest {
  const UpdateWebhookRequest({this.name, this.avatar, this.channelId});

  /// Converts a `Map<String, dynamic>` to a [UpdateWebhookRequest].
  factory UpdateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateWebhookRequest',
      json,
      () => UpdateWebhookRequest(
        name: json['name'] as String?,
        avatar: maybeBase64Decode(json['avatar'] as String?),
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateWebhookRequest.fromJson(json);
  }

  final String? name;
  final Uint8List? avatar;
  final SnowflakeType? channelId;

  /// Converts a [UpdateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'avatar': maybeBase64Encode(avatar),
      'channel_id': channelId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(avatar), channelId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateWebhookRequest &&
        name == other.name &&
        listsEqual(avatar, other.avatar) &&
        channelId == other.channelId;
  }
}
