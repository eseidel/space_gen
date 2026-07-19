import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ComponentEmojiForRequest {
  const ComponentEmojiForRequest({required this.name, this.id});

  /// Converts a `Map<String, dynamic>` to a [ComponentEmojiForRequest].
  factory ComponentEmojiForRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ComponentEmojiForRequest',
      json,
      () => ComponentEmojiForRequest(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ComponentEmojiForRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ComponentEmojiForRequest.fromJson(json);
  }

  final SnowflakeType? id;
  final String name;

  /// Converts a [ComponentEmojiForRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id?.toJson(), 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ComponentEmojiForRequest &&
        id == other.id &&
        name == other.name;
  }
}
