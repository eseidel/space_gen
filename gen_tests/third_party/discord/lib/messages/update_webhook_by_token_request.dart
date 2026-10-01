// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateWebhookByTokenRequest {
  UpdateWebhookByTokenRequest({this.name, this.avatar}) {
    name?.validate(minLength: 1, maxLength: 80);
  }

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
    return {'name': ?name, 'avatar': maybeBase64Encode(avatar)};
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
