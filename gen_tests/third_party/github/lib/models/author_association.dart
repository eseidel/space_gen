/// author_association
/// How the author is associated with the repository.
/// Example: `'OWNER'`
enum AuthorAssociation {
  collaborator._('COLLABORATOR'),
  contributor._('CONTRIBUTOR'),
  firstTimer._('FIRST_TIMER'),
  firstTimeContributor._('FIRST_TIME_CONTRIBUTOR'),
  mannequin._('MANNEQUIN'),
  member._('MEMBER'),
  none._('NONE'),
  owner._('OWNER');

  const AuthorAssociation._(this.value);

  /// Creates a AuthorAssociation from a json value.
  factory AuthorAssociation.fromJson(String json) {
    return AuthorAssociation.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AuthorAssociation value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AuthorAssociation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AuthorAssociation.fromJson(json);
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
