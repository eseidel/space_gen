enum RepositoryRuleMergeQueueType {
  mergeQueue._('merge_queue');

  const RepositoryRuleMergeQueueType._(this.value);

  /// Creates a RepositoryRuleMergeQueueType from a json value.
  factory RepositoryRuleMergeQueueType.fromJson(String json) {
    return RepositoryRuleMergeQueueType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleMergeQueueType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleMergeQueueType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMergeQueueType.fromJson(json);
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
