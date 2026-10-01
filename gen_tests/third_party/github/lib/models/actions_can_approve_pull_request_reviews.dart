// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
// `avoid_positional_boolean_parameters` is correct for user-facing
// APIs but wrong for a newtype wrapper — the type name is the
// disambiguation. Suppress file-locally.
// ignore_for_file: avoid_positional_boolean_parameters

/// Whether GitHub Actions can approve pull requests. Enabling this can be a
/// security risk.
extension type const ActionsCanApprovePullRequestReviews._(bool value) {
  const ActionsCanApprovePullRequestReviews(this.value);

  factory ActionsCanApprovePullRequestReviews.fromJson(bool json) =>
      ActionsCanApprovePullRequestReviews(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCanApprovePullRequestReviews? maybeFromJson(bool? json) {
    if (json == null) {
      return null;
    }
    return ActionsCanApprovePullRequestReviews.fromJson(json);
  }

  bool toJson() => value;
}
