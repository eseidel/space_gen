enum ThreadSortOrder {
  /// Sort forum posts by activity
  latestActivity._(0),

  /// Sort forum posts by creation time (from most recent to oldest)
  creationDate._(1);

  const ThreadSortOrder._(this.value);

  /// Creates a ThreadSortOrder from a json value.
  factory ThreadSortOrder.fromJson(int json) {
    return ThreadSortOrder.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ThreadSortOrder value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ThreadSortOrder? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ThreadSortOrder.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
