import 'package:discord/api_exception.dart';

extension type const CreateLobbyRequestFlagsOneOf1._(int value) {
  CreateLobbyRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory CreateLobbyRequestFlagsOneOf1.fromJson(int json) =>
      CreateLobbyRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return CreateLobbyRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
