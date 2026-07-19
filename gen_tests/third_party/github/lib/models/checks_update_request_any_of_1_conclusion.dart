/// **Required if you provide `completed_at` or a `status` of `completed`**. The
/// final conclusion of the check.
/// **Note:** Providing `conclusion` will automatically set the `status`
/// parameter to `completed`. You cannot change a check run conclusion to
/// `stale`, only GitHub can set this.
enum ChecksUpdateRequestAnyOf1Conclusion {
  actionRequired._('action_required'),
  cancelled._('cancelled'),
  failure._('failure'),
  neutral._('neutral'),
  success._('success'),
  skipped._('skipped'),
  stale._('stale'),
  timedOut._('timed_out');

  const ChecksUpdateRequestAnyOf1Conclusion._(this.value);

  /// Creates a ChecksUpdateRequestAnyOf1Conclusion from a json value.
  factory ChecksUpdateRequestAnyOf1Conclusion.fromJson(String json) {
    return ChecksUpdateRequestAnyOf1Conclusion.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksUpdateRequestAnyOf1Conclusion value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf1Conclusion? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1Conclusion.fromJson(json);
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
