/// Controls whether the response's `totalItems` field is
/// computed. Pass `exclude` to skip the count when the caller
/// doesn't need it. Defaults to `include`.
enum QueryEntitiesByPredicateRequestTotalItems {
  include._('include'),
  exclude._('exclude');

  const QueryEntitiesByPredicateRequestTotalItems._(this.value);

  /// Creates a QueryEntitiesByPredicateRequestTotalItems from a json value.
  factory QueryEntitiesByPredicateRequestTotalItems.fromJson(String json) {
    return QueryEntitiesByPredicateRequestTotalItems.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown QueryEntitiesByPredicateRequestTotalItems value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static QueryEntitiesByPredicateRequestTotalItems? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return QueryEntitiesByPredicateRequestTotalItems.fromJson(json);
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
