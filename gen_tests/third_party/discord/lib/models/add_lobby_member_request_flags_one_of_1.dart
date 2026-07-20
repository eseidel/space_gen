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
