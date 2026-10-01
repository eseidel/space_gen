// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ApiInsightsSortParamInner {
  lastRateLimitedTimestamp._('last_rate_limited_timestamp'),
  lastRequestTimestamp._('last_request_timestamp'),
  rateLimitedRequestCount._('rate_limited_request_count'),
  subjectName._('subject_name'),
  totalRequestCount._('total_request_count');

  const ApiInsightsSortParamInner._(this.value);

  /// Creates a ApiInsightsSortParamInner from a json value.
  factory ApiInsightsSortParamInner.fromJson(String json) {
    return ApiInsightsSortParamInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApiInsightsSortParamInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApiInsightsSortParamInner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsSortParamInner.fromJson(json);
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
