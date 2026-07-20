import 'package:discord/api_exception.dart';

extension type const EditLobbyRequestFlagsOneOf1._(int value) {
  EditLobbyRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory EditLobbyRequestFlagsOneOf1.fromJson(int json) =>
      EditLobbyRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EditLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return EditLobbyRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
