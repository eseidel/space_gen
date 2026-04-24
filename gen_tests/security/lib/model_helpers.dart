/// Runs [build] to construct a `fromJson`-parsed value of type [T],
/// converting any `TypeError` (e.g. an unexpected null or a cast
/// failure on a required field) into a `FormatException` that names
/// the class and includes the offending JSON. Generated `fromJson`
/// factories delegate to this so callers that catch `Exception`
/// treat malformed bodies as a parse error, not a crash.
T parseFromJson<T>(
  String className,
  Map<String, dynamic> json,
  T Function() build,
) {
  try {
    return build();
    // Rewrapping TypeError as FormatException is the whole point.
    // ignore: avoid_catching_errors
  } on TypeError catch (error) {
    throw FormatException('Failed to parse $className from JSON: $error', json);
  }
}
