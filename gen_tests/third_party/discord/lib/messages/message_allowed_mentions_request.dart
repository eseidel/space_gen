import 'package:discord/model_helpers.dart';
import 'package:discord/models/allowed_mention_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageAllowedMentionsRequest {
  const MessageAllowedMentionsRequest({
    this.parse,
    this.users,
    this.roles,
    this.repliedUser,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageAllowedMentionsRequest].
  factory MessageAllowedMentionsRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageAllowedMentionsRequest',
      json,
      () => MessageAllowedMentionsRequest(
        parse: (json['parse'] as List?)
            ?.map<AllowedMentionTypes>(
              (e) => AllowedMentionTypes.fromJson(e as String),
            )
            .toList(),
        users: (json['users'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        roles: (json['roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        repliedUser: json['replied_user'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageAllowedMentionsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageAllowedMentionsRequest.fromJson(json);
  }

  final List<AllowedMentionTypes>? parse;
  final List<SnowflakeType>? users;
  final List<SnowflakeType>? roles;
  final bool? repliedUser;

  /// Converts a [MessageAllowedMentionsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'parse': parse?.map((e) => e.toJson()).toList(),
      'users': users?.map((e) => e.toJson()).toList(),
      'roles': roles?.map((e) => e.toJson()).toList(),
      'replied_user': repliedUser,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(parse),
    listHash(users),
    listHash(roles),
    repliedUser,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageAllowedMentionsRequest &&
        listsEqual(parse, other.parse) &&
        listsEqual(users, other.users) &&
        listsEqual(roles, other.roles) &&
        repliedUser == other.repliedUser;
  }
}
