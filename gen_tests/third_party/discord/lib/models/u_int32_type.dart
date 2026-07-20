import 'package:discord/api_exception.dart';

extension type const UInt32Type._(int value) {
  UInt32Type(this.value) {
    value.validate(min: 0, max: 4294967295);
  }

  factory UInt32Type.fromJson(int json) => UInt32Type(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UInt32Type? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return UInt32Type.fromJson(json);
  }

  int toJson() => value;
}
