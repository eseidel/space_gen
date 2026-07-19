import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class WidgetChannel {
  const WidgetChannel({
    required this.id,
    required this.name,
    required this.position,
  });

  /// Converts a `Map<String, dynamic>` to a [WidgetChannel].
  factory WidgetChannel.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WidgetChannel',
      json,
      () => WidgetChannel(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        position: json['position'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WidgetChannel? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WidgetChannel.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final int position;

  /// Converts a [WidgetChannel] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'name': name, 'position': position};
  }

  @override
  int get hashCode => Object.hashAll([id, name, position]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WidgetChannel &&
        id == other.id &&
        name == other.name &&
        position == other.position;
  }
}
