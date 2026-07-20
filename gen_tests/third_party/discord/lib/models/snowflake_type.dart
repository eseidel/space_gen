import 'package:discord/api_exception.dart';

extension type const SnowflakeType._(String value) {
  SnowflakeType(this.value) {
    value.validate(pattern: r'^(0|[1-9][0-9]*)$');
  }

  factory SnowflakeType.fromJson(String json) => SnowflakeType(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SnowflakeType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SnowflakeType.fromJson(json);
  }

  String toJson() => value;
}
