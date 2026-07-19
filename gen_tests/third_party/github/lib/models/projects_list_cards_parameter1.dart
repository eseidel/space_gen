enum ProjectsListCardsParameter1 {
  all._('all'),
  archived._('archived'),
  notArchived._('not_archived');

  const ProjectsListCardsParameter1._(this.value);

  /// Creates a ProjectsListCardsParameter1 from a json value.
  factory ProjectsListCardsParameter1.fromJson(String json) {
    return ProjectsListCardsParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListCardsParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListCardsParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListCardsParameter1.fromJson(json);
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
