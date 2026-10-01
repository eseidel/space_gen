// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The type of the activity that was performed.
/// Example: `'force_push'`
enum ActivityActivityType {
  push._('push'),
  forcePush._('force_push'),
  branchDeletion._('branch_deletion'),
  branchCreation._('branch_creation'),
  prMerge._('pr_merge'),
  mergeQueueMerge._('merge_queue_merge');

  const ActivityActivityType._(this.value);

  /// Creates a ActivityActivityType from a json value.
  factory ActivityActivityType.fromJson(String json) {
    return ActivityActivityType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ActivityActivityType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActivityActivityType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActivityActivityType.fromJson(json);
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
