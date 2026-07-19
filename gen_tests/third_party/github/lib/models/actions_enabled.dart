// `avoid_positional_boolean_parameters` is correct for user-facing
// APIs but wrong for a newtype wrapper — the type name is the
// disambiguation. Suppress file-locally.
// ignore_for_file: avoid_positional_boolean_parameters

/// Whether GitHub Actions is enabled on the repository.
extension type const ActionsEnabled._(bool value) {
  const ActionsEnabled(this.value);

  factory ActionsEnabled.fromJson(bool json) => ActionsEnabled(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsEnabled? maybeFromJson(bool? json) {
    if (json == null) {
      return null;
    }
    return ActionsEnabled.fromJson(json);
  }

  bool toJson() => value;
}
