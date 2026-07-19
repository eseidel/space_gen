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
