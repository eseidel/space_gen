/// Default permission level members have for organization repositories.
enum OrgsUpdateRequestDefaultRepositoryPermission {
  read._('read'),
  write._('write'),
  admin._('admin'),
  none._('none');

  const OrgsUpdateRequestDefaultRepositoryPermission._(this.value);

  /// Creates a OrgsUpdateRequestDefaultRepositoryPermission from a json value.
  factory OrgsUpdateRequestDefaultRepositoryPermission.fromJson(String json) {
    return OrgsUpdateRequestDefaultRepositoryPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsUpdateRequestDefaultRepositoryPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsUpdateRequestDefaultRepositoryPermission? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateRequestDefaultRepositoryPermission.fromJson(json);
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
