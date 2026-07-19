import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateWebhookByTokenRequest {
  const UpdateWebhookByTokenRequest({this.name, this.avatar});

  /// Converts a `Map<String, dynamic>` to a [UpdateWebhookByTokenRequest].
  factory UpdateWebhookByTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateWebhookByTokenRequest',
      json,
      () => UpdateWebhookByTokenRequest(
        name: json['name'] as String?,
        avatar: maybeBase64Decode(json['avatar'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateWebhookByTokenRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateWebhookByTokenRequest.fromJson(json);
  }

  final String? name;
  final Uint8List? avatar;

  /// Converts a [UpdateWebhookByTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      'avatar': maybeBase64Encode(avatar),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(avatar)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateWebhookByTokenRequest &&
        name == other.name &&
        listsEqual(avatar, other.avatar);
  }
}
