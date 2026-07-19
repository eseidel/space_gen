/// The originating VCS type. Without this parameter, the import job will take
/// additional time to detect the VCS type before beginning the import. This
/// detection step will be reflected in the response.
enum MigrationsStartImportRequestVcs {
  subversion._('subversion'),
  git._('git'),
  mercurial._('mercurial'),
  tfvc._('tfvc');

  const MigrationsStartImportRequestVcs._(this.value);

  /// Creates a MigrationsStartImportRequestVcs from a json value.
  factory MigrationsStartImportRequestVcs.fromJson(String json) {
    return MigrationsStartImportRequestVcs.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsStartImportRequestVcs value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsStartImportRequestVcs? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsStartImportRequestVcs.fromJson(json);
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
