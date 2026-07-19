// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Which users can access codespaces in the organization. `disabled` means that
/// no users can access codespaces in the organization.
enum CodespacesSetCodespacesAccessRequestVisibility {
  disabled._('disabled'),
  selectedMembers._('selected_members'),
  allMembers._('all_members'),
  allMembersAndOutsideCollaborators._('all_members_and_outside_collaborators');

  const CodespacesSetCodespacesAccessRequestVisibility._(this.value);

  /// Creates a CodespacesSetCodespacesAccessRequestVisibility from a json value.
  factory CodespacesSetCodespacesAccessRequestVisibility.fromJson(String json) {
    return CodespacesSetCodespacesAccessRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodespacesSetCodespacesAccessRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespacesSetCodespacesAccessRequestVisibility? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesSetCodespacesAccessRequestVisibility.fromJson(json);
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
