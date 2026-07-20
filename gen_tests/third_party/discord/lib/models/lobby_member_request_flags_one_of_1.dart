import 'package:discord/api_exception.dart';

extension type const LobbyMemberRequestFlagsOneOf1._(int value) {
  LobbyMemberRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory LobbyMemberRequestFlagsOneOf1.fromJson(int json) =>
      LobbyMemberRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyMemberRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return LobbyMemberRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
