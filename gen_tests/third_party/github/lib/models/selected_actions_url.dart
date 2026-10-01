// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
