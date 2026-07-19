/// The type of version control system you are migrating from.
/// Example: `'"git"'`
enum MigrationsUpdateImportRequestVcs {
  subversion._('subversion'),
  tfvc._('tfvc'),
  git._('git'),
  mercurial._('mercurial');

  const MigrationsUpdateImportRequestVcs._(this.value);

  /// Creates a MigrationsUpdateImportRequestVcs from a json value.
  factory MigrationsUpdateImportRequestVcs.fromJson(String json) {
    return MigrationsUpdateImportRequestVcs.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsUpdateImportRequestVcs value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsUpdateImportRequestVcs? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsUpdateImportRequestVcs.fromJson(json);
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
