import 'package:discord/api_exception.dart';

extension type const Int53Type._(int value) {
  Int53Type(this.value) {
    value
      ..validateMaximum(9007199254740991)
      ..validateMinimum(-9007199254740991);
  }

  factory Int53Type.fromJson(int json) => Int53Type(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Int53Type? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return Int53Type.fromJson(json);
  }

  int toJson() => value;
}
