enum ThreadSortingMode {
  relevance._('relevance'),
  creationTime._('creation_time'),
  lastMessageTime._('last_message_time'),
  archiveTime._('archive_time');

  const ThreadSortingMode._(this.value);

  /// Creates a ThreadSortingMode from a json value.
  factory ThreadSortingMode.fromJson(String json) {
    return ThreadSortingMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ThreadSortingMode value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ThreadSortingMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ThreadSortingMode.fromJson(json);
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
