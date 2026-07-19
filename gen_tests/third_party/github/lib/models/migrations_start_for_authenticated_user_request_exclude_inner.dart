// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Allowed values that can be passed to the exclude param.
/// Example: `'repositories'`
enum MigrationsStartForAuthenticatedUserRequestExcludeInner {
  repositories._('repositories');

  const MigrationsStartForAuthenticatedUserRequestExcludeInner._(this.value);

  /// Creates a MigrationsStartForAuthenticatedUserRequestExcludeInner from a json value.
  factory MigrationsStartForAuthenticatedUserRequestExcludeInner.fromJson(
    String json,
  ) {
    return MigrationsStartForAuthenticatedUserRequestExcludeInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsStartForAuthenticatedUserRequestExcludeInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsStartForAuthenticatedUserRequestExcludeInner? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsStartForAuthenticatedUserRequestExcludeInner.fromJson(
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
