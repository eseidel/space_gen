/// The API URL to use to get or set the actions and reusable workflows that are
/// allowed to run, when `allowed_actions` is set to `selected`.
extension type const SelectedActionsUrl._(String value) {
  const SelectedActionsUrl(this.value);

  factory SelectedActionsUrl.fromJson(String json) => SelectedActionsUrl(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SelectedActionsUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SelectedActionsUrl.fromJson(json);
  }

  String toJson() => value;
}
