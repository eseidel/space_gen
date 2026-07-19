enum ImportStatus {
  auth._('auth'),
  error._('error'),
  none._('none'),
  detecting._('detecting'),
  choose._('choose'),
  authFailed._('auth_failed'),
  importing._('importing'),
  mapping._('mapping'),
  waitingToPush._('waiting_to_push'),
  pushing._('pushing'),
  complete._('complete'),
  setup._('setup'),
  unknown._('unknown'),
  detectionFoundMultiple._('detection_found_multiple'),
  detectionFoundNothing._('detection_found_nothing'),
  detectionNeedsAuth._('detection_needs_auth');

  const ImportStatus._(this.value);

  /// Creates a ImportStatus from a json value.
  factory ImportStatus.fromJson(String json) {
    return ImportStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ImportStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ImportStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ImportStatus.fromJson(json);
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
