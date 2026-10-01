// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateApplicationEmojiRequest {
  UpdateApplicationEmojiRequest({this.name}) {
    name?.validate(minLength: 2, maxLength: 32);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateApplicationEmojiRequest].
  factory UpdateApplicationEmojiRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateApplicationEmojiRequest',
      json,
      () => UpdateApplicationEmojiRequest(name: json['name'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateApplicationEmojiRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateApplicationEmojiRequest.fromJson(json);
  }

  final String? name;

  /// Converts a [UpdateApplicationEmojiRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateApplicationEmojiRequest && name == other.name;
  }
}
