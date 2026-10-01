// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:types/api_exception.dart';

/// An integer enum — a closed set of int values. Renders as a validated int
/// newtype (not a Dart enum); the generated round-trip test also exercises the
/// membership check throwing FormatException on an out-of-set value.
extension type const Priority._(int value) {
  Priority(this.value) {
    value.validateEnumValues([1, 2, 3]);
  }

  factory Priority.fromJson(int json) => Priority(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Priority? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return Priority.fromJson(json);
  }

  int toJson() => value;
}
