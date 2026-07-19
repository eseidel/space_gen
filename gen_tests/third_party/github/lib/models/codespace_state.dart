/// State of this codespace.
/// Example: `'Available'`
enum CodespaceState {
  unknown._('Unknown'),
  created._('Created'),
  queued._('Queued'),
  provisioning._('Provisioning'),
  available._('Available'),
  awaiting._('Awaiting'),
  unavailable._('Unavailable'),
  deleted._('Deleted'),
  moved._('Moved'),
  shutdown._('Shutdown'),
  archived._('Archived'),
  starting._('Starting'),
  shuttingDown._('ShuttingDown'),
  failed._('Failed'),
  exporting._('Exporting'),
  updating._('Updating'),
  rebuilding._('Rebuilding');

  const CodespaceState._(this.value);

  /// Creates a CodespaceState from a json value.
  factory CodespaceState.fromJson(String json) {
    return CodespaceState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CodespaceState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespaceState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodespaceState.fromJson(json);
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
