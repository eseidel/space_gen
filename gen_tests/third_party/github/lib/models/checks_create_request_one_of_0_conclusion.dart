/// **Required if you provide `completed_at` or a `status` of `completed`**. The
/// final conclusion of the check.
/// **Note:** Providing `conclusion` will automatically set the `status`
/// parameter to `completed`. You cannot change a check run conclusion to
/// `stale`, only GitHub can set this.
enum ChecksCreateRequestOneOf0Conclusion {
  actionRequired._('action_required'),
  cancelled._('cancelled'),
  failure._('failure'),
  neutral._('neutral'),
  success._('success'),
  skipped._('skipped'),
  stale._('stale'),
  timedOut._('timed_out');

  const ChecksCreateRequestOneOf0Conclusion._(this.value);

  /// Creates a ChecksCreateRequestOneOf0Conclusion from a json value.
  factory ChecksCreateRequestOneOf0Conclusion.fromJson(String json) {
    return ChecksCreateRequestOneOf0Conclusion.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksCreateRequestOneOf0Conclusion value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf0Conclusion? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf0Conclusion.fromJson(json);
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
