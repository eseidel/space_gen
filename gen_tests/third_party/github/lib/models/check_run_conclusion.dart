// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Example: `'neutral'`
enum CheckRunConclusion {
  success._('success'),
  failure._('failure'),
  neutral._('neutral'),
  cancelled._('cancelled'),
  skipped._('skipped'),
  timedOut._('timed_out'),
  actionRequired._('action_required');

  const CheckRunConclusion._(this.value);

  /// Creates a CheckRunConclusion from a json value.
  factory CheckRunConclusion.fromJson(String json) {
    return CheckRunConclusion.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CheckRunConclusion value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CheckRunConclusion? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CheckRunConclusion.fromJson(json);
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
