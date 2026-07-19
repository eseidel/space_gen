/// Action to apply to the fine-grained personal access token.
enum OrgsUpdatePatAccessesRequestAction {
  revoke._('revoke');

  const OrgsUpdatePatAccessesRequestAction._(this.value);

  /// Creates a OrgsUpdatePatAccessesRequestAction from a json value.
  factory OrgsUpdatePatAccessesRequestAction.fromJson(String json) {
    return OrgsUpdatePatAccessesRequestAction.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsUpdatePatAccessesRequestAction value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessesRequestAction? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessesRequestAction.fromJson(json);
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
