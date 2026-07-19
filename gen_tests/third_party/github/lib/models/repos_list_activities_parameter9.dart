enum ReposListActivitiesParameter9 {
  push._('push'),
  forcePush._('force_push'),
  branchCreation._('branch_creation'),
  branchDeletion._('branch_deletion'),
  prMerge._('pr_merge'),
  mergeQueueMerge._('merge_queue_merge');

  const ReposListActivitiesParameter9._(this.value);

  /// Creates a ReposListActivitiesParameter9 from a json value.
  factory ReposListActivitiesParameter9.fromJson(String json) {
    return ReposListActivitiesParameter9.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListActivitiesParameter9 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListActivitiesParameter9? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListActivitiesParameter9.fromJson(json);
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
