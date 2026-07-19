/// The level of permission to grant the access token to manage git SSH keys.
enum AppPermissionsGitSshKeys {
  read._('read'),
  write._('write');

  const AppPermissionsGitSshKeys._(this.value);

  /// Creates a AppPermissionsGitSshKeys from a json value.
  factory AppPermissionsGitSshKeys.fromJson(String json) {
    return AppPermissionsGitSshKeys.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsGitSshKeys value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsGitSshKeys? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsGitSshKeys.fromJson(json);
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
