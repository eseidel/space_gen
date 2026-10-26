enum ReposListActivitiesActivityType {
  push._('push'),
  forcePush._('force_push'),
  branchCreation._('branch_creation'),
  branchDeletion._('branch_deletion'),
  prMerge._('pr_merge'),
  mergeQueueMerge._('merge_queue_merge');

  const ReposListActivitiesActivityType._(this.value);

  /// Creates a ReposListActivitiesActivityType from a json value.
  factory ReposListActivitiesActivityType.fromJson(String json) {
    return ReposListActivitiesActivityType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListActivitiesActivityType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListActivitiesActivityType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListActivitiesActivityType.fromJson(json);
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
