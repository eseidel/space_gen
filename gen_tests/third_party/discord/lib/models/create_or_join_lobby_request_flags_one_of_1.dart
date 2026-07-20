import 'package:discord/api_exception.dart';

extension type const CreateOrJoinLobbyRequestFlagsOneOf1._(int value) {
  CreateOrJoinLobbyRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory CreateOrJoinLobbyRequestFlagsOneOf1.fromJson(int json) =>
      CreateOrJoinLobbyRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateOrJoinLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return CreateOrJoinLobbyRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
