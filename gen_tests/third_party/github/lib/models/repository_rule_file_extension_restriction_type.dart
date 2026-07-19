enum RepositoryRuleFileExtensionRestrictionType {
  fileExtensionRestriction._('file_extension_restriction');

  const RepositoryRuleFileExtensionRestrictionType._(this.value);

  /// Creates a RepositoryRuleFileExtensionRestrictionType from a json value.
  factory RepositoryRuleFileExtensionRestrictionType.fromJson(String json) {
    return RepositoryRuleFileExtensionRestrictionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleFileExtensionRestrictionType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleFileExtensionRestrictionType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleFileExtensionRestrictionType.fromJson(json);
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
