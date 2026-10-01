// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The amount of time to delay a job after the job is initially triggered. The
/// time (in minutes) must be an integer between 0 and 43,200 (30 days).
/// Example: `30`
extension type const WaitTimer._(int value) {
  const WaitTimer(this.value);

  factory WaitTimer.fromJson(int json) => WaitTimer(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaitTimer? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return WaitTimer.fromJson(json);
  }

  int toJson() => value;
}
