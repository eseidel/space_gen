enum MessageReferenceType {
  /// Reference to a message
  default_._(0);

  const MessageReferenceType._(this.value);

  /// Creates a MessageReferenceType from a json value.
  factory MessageReferenceType.fromJson(int json) {
    return MessageReferenceType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MessageReferenceType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MessageReferenceType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MessageReferenceType.fromJson(json);
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
