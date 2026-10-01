// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
