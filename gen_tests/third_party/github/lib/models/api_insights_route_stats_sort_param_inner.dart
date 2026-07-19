enum ApiInsightsRouteStatsSortParamInner {
  lastRateLimitedTimestamp._('last_rate_limited_timestamp'),
  lastRequestTimestamp._('last_request_timestamp'),
  rateLimitedRequestCount._('rate_limited_request_count'),
  httpMethod._('http_method'),
  apiRoute._('api_route'),
  totalRequestCount._('total_request_count');

  const ApiInsightsRouteStatsSortParamInner._(this.value);

  /// Creates a ApiInsightsRouteStatsSortParamInner from a json value.
  factory ApiInsightsRouteStatsSortParamInner.fromJson(String json) {
    return ApiInsightsRouteStatsSortParamInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApiInsightsRouteStatsSortParamInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApiInsightsRouteStatsSortParamInner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsRouteStatsSortParamInner.fromJson(json);
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
