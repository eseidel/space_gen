enum TargetUsersJobStatusTypes {
  /// The default value.
  unspecified._(0),

  /// The job is still being processed.
  processing._(1),

  /// The job has been completed successfully.
  completed._(2),

  /// The job has failed, see error_message field for more details.
  failed._(3);

  const TargetUsersJobStatusTypes._(this.value);

  /// Creates a TargetUsersJobStatusTypes from a json value.
  factory TargetUsersJobStatusTypes.fromJson(int json) {
    return TargetUsersJobStatusTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TargetUsersJobStatusTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TargetUsersJobStatusTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return TargetUsersJobStatusTypes.fromJson(json);
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
