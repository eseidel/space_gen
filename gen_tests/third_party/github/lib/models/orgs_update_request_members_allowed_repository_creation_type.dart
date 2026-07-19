// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Specifies which types of repositories non-admin organization members can
/// create. `private` is only available to repositories that are part of an
/// organization on GitHub Enterprise Cloud.
/// **Note:** This parameter is closing down and will be removed in the future.
/// Its return value ignores internal repositories. Using this parameter
/// overrides values set in `members_can_create_repositories`. See the parameter
/// deprecation notice in the operation description for details.
enum OrgsUpdateRequestMembersAllowedRepositoryCreationType {
  all._('all'),
  private._('private'),
  none._('none');

  const OrgsUpdateRequestMembersAllowedRepositoryCreationType._(this.value);

  /// Creates a OrgsUpdateRequestMembersAllowedRepositoryCreationType from a json value.
  factory OrgsUpdateRequestMembersAllowedRepositoryCreationType.fromJson(
    String json,
  ) {
    return OrgsUpdateRequestMembersAllowedRepositoryCreationType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsUpdateRequestMembersAllowedRepositoryCreationType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsUpdateRequestMembersAllowedRepositoryCreationType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateRequestMembersAllowedRepositoryCreationType.fromJson(json);
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
