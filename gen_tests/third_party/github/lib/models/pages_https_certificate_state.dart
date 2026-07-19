/// Example: `'approved'`
enum PagesHttpsCertificateState {
  new_._('new'),
  authorizationCreated._('authorization_created'),
  authorizationPending._('authorization_pending'),
  authorized._('authorized'),
  authorizationRevoked._('authorization_revoked'),
  issued._('issued'),
  uploaded._('uploaded'),
  approved._('approved'),
  errored._('errored'),
  badAuthz._('bad_authz'),
  destroyPending._('destroy_pending'),
  dnsChanged._('dns_changed');

  const PagesHttpsCertificateState._(this.value);

  /// Creates a PagesHttpsCertificateState from a json value.
  factory PagesHttpsCertificateState.fromJson(String json) {
    return PagesHttpsCertificateState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PagesHttpsCertificateState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PagesHttpsCertificateState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PagesHttpsCertificateState.fromJson(json);
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
