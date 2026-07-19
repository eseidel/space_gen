/// The state if the domain is verified
/// Example: `'pending'`
enum PageProtectedDomainState {
  pending._('pending'),
  verified._('verified'),
  unverified._('unverified');

  const PageProtectedDomainState._(this.value);

  /// Creates a PageProtectedDomainState from a json value.
  factory PageProtectedDomainState.fromJson(String json) {
    return PageProtectedDomainState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PageProtectedDomainState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PageProtectedDomainState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PageProtectedDomainState.fromJson(json);
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
