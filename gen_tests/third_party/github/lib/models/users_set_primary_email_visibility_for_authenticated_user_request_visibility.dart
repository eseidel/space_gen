// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Denotes whether an email is publicly visible.
enum UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility {
  public._('public'),
  private._('private');

  const UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility._(
    this.value,
  );

  /// Creates a UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility from a json value.
  factory UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility.fromJson(
    String json,
  ) {
    return UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility.fromJson(
      json,
    );
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
