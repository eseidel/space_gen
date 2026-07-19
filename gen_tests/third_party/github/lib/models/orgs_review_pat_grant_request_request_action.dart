/// Action to apply to the request.
enum OrgsReviewPatGrantRequestRequestAction {
  approve._('approve'),
  deny._('deny');

  const OrgsReviewPatGrantRequestRequestAction._(this.value);

  /// Creates a OrgsReviewPatGrantRequestRequestAction from a json value.
  factory OrgsReviewPatGrantRequestRequestAction.fromJson(String json) {
    return OrgsReviewPatGrantRequestRequestAction.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsReviewPatGrantRequestRequestAction value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsReviewPatGrantRequestRequestAction? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsReviewPatGrantRequestRequestAction.fromJson(json);
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
