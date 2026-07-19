/// Action to apply to the fine-grained personal access token.
enum OrgsUpdatePatAccessRequestAction {
  revoke._('revoke');

  const OrgsUpdatePatAccessRequestAction._(this.value);

  /// Creates a OrgsUpdatePatAccessRequestAction from a json value.
  factory OrgsUpdatePatAccessRequestAction.fromJson(String json) {
    return OrgsUpdatePatAccessRequestAction.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsUpdatePatAccessRequestAction value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessRequestAction? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessRequestAction.fromJson(json);
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
