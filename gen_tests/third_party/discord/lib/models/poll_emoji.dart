import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PollEmoji {
  PollEmoji({this.id, this.name, this.animated}) {
    name?.validate(maxLength: 32);
  }

  /// Converts a `Map<String, dynamic>` to a [PollEmoji].
  factory PollEmoji.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollEmoji',
      json,
      () => PollEmoji(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        name: json['name'] as String?,
        animated: json['animated'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollEmoji? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollEmoji.fromJson(json);
  }

  final SnowflakeType? id;
  final String? name;
  final bool? animated;

  /// Converts a [PollEmoji] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id?.toJson(), 'name': name, 'animated': animated};
  }

  @override
  int get hashCode => Object.hashAll([id, name, animated]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollEmoji &&
        id == other.id &&
        name == other.name &&
        animated == other.animated;
  }
}
