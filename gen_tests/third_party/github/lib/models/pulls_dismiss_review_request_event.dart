/// Example: `'"DISMISS"'`
enum PullsDismissReviewRequestEvent {
  dismiss._('DISMISS');

  const PullsDismissReviewRequestEvent._(this.value);

  /// Creates a PullsDismissReviewRequestEvent from a json value.
  factory PullsDismissReviewRequestEvent.fromJson(String json) {
    return PullsDismissReviewRequestEvent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsDismissReviewRequestEvent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsDismissReviewRequestEvent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsDismissReviewRequestEvent.fromJson(json);
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
