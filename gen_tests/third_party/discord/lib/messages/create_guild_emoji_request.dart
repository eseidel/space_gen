import 'dart:convert';
import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class CreateGuildEmojiRequest {
  CreateGuildEmojiRequest({
    required this.name,
    required this.image,
    this.roles,
  }) {
    name.validate(minLength: 2, maxLength: 32);
    roles?.validate(maxItems: 1521, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateGuildEmojiRequest].
  factory CreateGuildEmojiRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGuildEmojiRequest',
      json,
      () => CreateGuildEmojiRequest(
        name: json['name'] as String,
        image: base64.decode(json['image'] as String),
        roles: (json['roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildEmojiRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildEmojiRequest.fromJson(json);
  }

  final String name;
  final Uint8List image;
  final List<SnowflakeType>? roles;

  /// Converts a [CreateGuildEmojiRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': base64.encode(image),
      'roles': roles?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(image), listHash(roles)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildEmojiRequest &&
        name == other.name &&
        listsEqual(image, other.image) &&
        listsEqual(roles, other.roles);
  }
}
