import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_select_default_value_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ChannelSelectDefaultValue {
  const ChannelSelectDefaultValue({required this.id});

  /// Converts a `Map<String, dynamic>` to a [ChannelSelectDefaultValue].
  factory ChannelSelectDefaultValue.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChannelSelectDefaultValue',
      json,
      () => ChannelSelectDefaultValue(
        id: SnowflakeType.fromJson(json['id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelSelectDefaultValue? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChannelSelectDefaultValue.fromJson(json);
  }

  SnowflakeSelectDefaultValueTypes get type =>
      SnowflakeSelectDefaultValueTypes.channel;
  final SnowflakeType id;

  /// Converts a [ChannelSelectDefaultValue] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'id': id.toJson()};
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelSelectDefaultValue && id == other.id;
  }
}
