enum MessageComponentSeparatorSpacingSize {
  /// Small spacing
  small._(1),

  /// Large spacing
  large._(2);

  const MessageComponentSeparatorSpacingSize._(this.value);

  /// Creates a MessageComponentSeparatorSpacingSize from a json value.
  factory MessageComponentSeparatorSpacingSize.fromJson(int json) {
    return MessageComponentSeparatorSpacingSize.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MessageComponentSeparatorSpacingSize value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MessageComponentSeparatorSpacingSize? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MessageComponentSeparatorSpacingSize.fromJson(json);
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
