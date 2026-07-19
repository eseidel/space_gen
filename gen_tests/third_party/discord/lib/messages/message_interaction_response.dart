import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageInteractionResponse {
  const MessageInteractionResponse({
    required this.id,
    required this.type,
    required this.name,
    this.user,
    this.nameLocalized,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageInteractionResponse].
  factory MessageInteractionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageInteractionResponse',
      json,
      () => MessageInteractionResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: InteractionTypes.fromJson(json['type'] as int),
        name: json['name'] as String,
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
        nameLocalized: json['name_localized'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageInteractionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageInteractionResponse.fromJson(json);
  }

  final SnowflakeType id;
  final InteractionTypes type;
  final String name;
  final UserResponse? user;
  final String? nameLocalized;

  /// Converts a [MessageInteractionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'name': name,
      if (user != null) 'user': user?.toJson(),
      if (nameLocalized != null) 'name_localized': nameLocalized,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, type, name, user, nameLocalized]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageInteractionResponse &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        user == other.user &&
        nameLocalized == other.nameLocalized;
  }
}
