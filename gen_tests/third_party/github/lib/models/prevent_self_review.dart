// `avoid_positional_boolean_parameters` is correct for user-facing
// APIs but wrong for a newtype wrapper — the type name is the
// disambiguation. Suppress file-locally.
// ignore_for_file: avoid_positional_boolean_parameters

/// Whether or not a user who created the job is prevented from approving their
/// own job.
/// Example: `false`
extension type const PreventSelfReview._(bool value) {
  const PreventSelfReview(this.value);

  factory PreventSelfReview.fromJson(bool json) => PreventSelfReview(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PreventSelfReview? maybeFromJson(bool? json) {
    if (json == null) {
      return null;
    }
    return PreventSelfReview.fromJson(json);
  }

  bool toJson() => value;
}
