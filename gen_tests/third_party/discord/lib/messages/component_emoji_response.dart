import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ComponentEmojiResponse {
  const ComponentEmojiResponse({required this.name, this.id, this.animated});

  /// Converts a `Map<String, dynamic>` to a [ComponentEmojiResponse].
  factory ComponentEmojiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ComponentEmojiResponse',
      json,
      () => ComponentEmojiResponse(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        name: json['name'] as String,
        animated: json['animated'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ComponentEmojiResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ComponentEmojiResponse.fromJson(json);
  }

  final SnowflakeType? id;
  final String name;
  final bool? animated;

  /// Converts a [ComponentEmojiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'name': name,
      if (animated != null) 'animated': animated,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, animated]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ComponentEmojiResponse &&
        id == other.id &&
        name == other.name &&
        animated == other.animated;
  }
}
