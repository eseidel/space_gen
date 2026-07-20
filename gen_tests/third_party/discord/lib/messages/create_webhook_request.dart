import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateWebhookRequest {
  CreateWebhookRequest({required this.name, this.avatar}) {
    name.validate(minLength: 1, maxLength: 80);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateWebhookRequest].
  factory CreateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateWebhookRequest',
      json,
      () => CreateWebhookRequest(
        name: json['name'] as String,
        avatar: maybeBase64Decode(json['avatar'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateWebhookRequest.fromJson(json);
  }

  final String name;
  final Uint8List? avatar;

  /// Converts a [CreateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'avatar': maybeBase64Encode(avatar)};
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(avatar)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateWebhookRequest &&
        name == other.name &&
        listsEqual(avatar, other.avatar);
  }
}
