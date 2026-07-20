import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildEmojiRequest {
  UpdateGuildEmojiRequest({this.name, this.roles}) {
    name?.validate(minLength: 2, maxLength: 32);
    roles?.validate(maxItems: 1521, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildEmojiRequest].
  factory UpdateGuildEmojiRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildEmojiRequest',
      json,
      () => UpdateGuildEmojiRequest(
        name: json['name'] as String?,
        roles: (json['roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildEmojiRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateGuildEmojiRequest.fromJson(json);
  }

  final String? name;
  final List<SnowflakeType>? roles;

  /// Converts a [UpdateGuildEmojiRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'roles': roles?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(roles)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildEmojiRequest &&
        name == other.name &&
        listsEqual(roles, other.roles);
  }
}
