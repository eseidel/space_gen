enum ConnectedAccountVisibility {
  none._(0),
  everyone._(1);

  const ConnectedAccountVisibility._(this.value);

  /// Creates a ConnectedAccountVisibility from a json value.
  factory ConnectedAccountVisibility.fromJson(int json) {
    return ConnectedAccountVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ConnectedAccountVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ConnectedAccountVisibility? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ConnectedAccountVisibility.fromJson(json);
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
