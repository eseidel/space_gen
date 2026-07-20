import 'package:discord/api_exception.dart';

extension type const BulkLobbyMemberRequestFlagsOneOf1._(int value) {
  BulkLobbyMemberRequestFlagsOneOf1(this.value) {
    value.validateEnumValues([1]);
  }

  factory BulkLobbyMemberRequestFlagsOneOf1.fromJson(int json) =>
      BulkLobbyMemberRequestFlagsOneOf1(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkLobbyMemberRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return BulkLobbyMemberRequestFlagsOneOf1.fromJson(json);
  }

  int toJson() => value;
}
