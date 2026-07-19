/// Action to apply to the requests.
enum OrgsReviewPatGrantRequestsInBulkRequestAction {
  approve._('approve'),
  deny._('deny');

  const OrgsReviewPatGrantRequestsInBulkRequestAction._(this.value);

  /// Creates a OrgsReviewPatGrantRequestsInBulkRequestAction from a json value.
  factory OrgsReviewPatGrantRequestsInBulkRequestAction.fromJson(String json) {
    return OrgsReviewPatGrantRequestsInBulkRequestAction.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsReviewPatGrantRequestsInBulkRequestAction value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsReviewPatGrantRequestsInBulkRequestAction? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsReviewPatGrantRequestsInBulkRequestAction.fromJson(json);
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
