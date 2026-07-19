/// Whether to store large files during the import. `opt_in` means large files
/// will be stored using Git LFS. `opt_out` means large files will be removed
/// during the import.
enum MigrationsSetLfsPreferenceRequestUseLfs {
  optIn._('opt_in'),
  optOut._('opt_out');

  const MigrationsSetLfsPreferenceRequestUseLfs._(this.value);

  /// Creates a MigrationsSetLfsPreferenceRequestUseLfs from a json value.
  factory MigrationsSetLfsPreferenceRequestUseLfs.fromJson(String json) {
    return MigrationsSetLfsPreferenceRequestUseLfs.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsSetLfsPreferenceRequestUseLfs value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsSetLfsPreferenceRequestUseLfs? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsSetLfsPreferenceRequestUseLfs.fromJson(json);
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
