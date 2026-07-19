import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class EmojiResponse {
  const EmojiResponse({
    required this.id,
    required this.name,
    required this.roles,
    required this.requireColons,
    required this.managed,
    required this.animated,
    required this.available,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to an [EmojiResponse].
  factory EmojiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EmojiResponse',
      json,
      () => EmojiResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
        roles: (json['roles'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        requireColons: json['require_colons'] as bool,
        managed: json['managed'] as bool,
        animated: json['animated'] as bool,
        available: json['available'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EmojiResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EmojiResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final UserResponse? user;
  final List<SnowflakeType> roles;
  final bool requireColons;
  final bool managed;
  final bool animated;
  final bool available;

  /// Converts an [EmojiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      if (user != null) 'user': user?.toJson(),
      'roles': roles.map((e) => e.toJson()).toList(),
      'require_colons': requireColons,
      'managed': managed,
      'animated': animated,
      'available': available,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    user,
    listHash(roles),
    requireColons,
    managed,
    animated,
    available,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EmojiResponse &&
        id == other.id &&
        name == other.name &&
        user == other.user &&
        listsEqual(roles, other.roles) &&
        requireColons == other.requireColons &&
        managed == other.managed &&
        animated == other.animated &&
        available == other.available;
  }
}
