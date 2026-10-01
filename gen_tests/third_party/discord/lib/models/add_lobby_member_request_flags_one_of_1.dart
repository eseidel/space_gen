// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';

extension type const AddLobbyMemberRequestFlagsOneOf1._(int value) {
  AddLobbyMemberRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory AddLobbyMemberRequestFlagsOneOf1.fromJson(int json) =>
      AddLobbyMemberRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AddLobbyMemberRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AddLobbyMemberRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
