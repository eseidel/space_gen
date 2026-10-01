// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';

extension type const Int53Type._(int value) {
  Int53Type(this.value) {
    value.validate(min: -9007199254740991, max: 9007199254740991);
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
