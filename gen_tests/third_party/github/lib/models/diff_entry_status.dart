/// Example: `'added'`
enum DiffEntryStatus {
  added._('added'),
  removed._('removed'),
  modified._('modified'),
  renamed._('renamed'),
  copied._('copied'),
  changed._('changed'),
  unchanged._('unchanged');

  const DiffEntryStatus._(this.value);

  /// Creates a DiffEntryStatus from a json value.
  factory DiffEntryStatus.fromJson(String json) {
    return DiffEntryStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DiffEntryStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DiffEntryStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DiffEntryStatus.fromJson(json);
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
