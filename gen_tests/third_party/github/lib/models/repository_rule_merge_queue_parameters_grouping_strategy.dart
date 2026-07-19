// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// When set to ALLGREEN, the merge commit created by merge queue for each PR in
/// the group must pass all required checks to merge. When set to HEADGREEN,
/// only the commit at the head of the merge group, i.e. the commit containing
/// changes from all of the PRs in the group, must pass its required checks to
/// merge.
enum RepositoryRuleMergeQueueParametersGroupingStrategy {
  allgreen._('ALLGREEN'),
  headgreen._('HEADGREEN');

  const RepositoryRuleMergeQueueParametersGroupingStrategy._(this.value);

  /// Creates a RepositoryRuleMergeQueueParametersGroupingStrategy from a json value.
  factory RepositoryRuleMergeQueueParametersGroupingStrategy.fromJson(
    String json,
  ) {
    return RepositoryRuleMergeQueueParametersGroupingStrategy.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleMergeQueueParametersGroupingStrategy value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleMergeQueueParametersGroupingStrategy? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMergeQueueParametersGroupingStrategy.fromJson(json);
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
