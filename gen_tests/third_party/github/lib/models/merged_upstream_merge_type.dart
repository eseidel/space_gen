// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum MergedUpstreamMergeType {
  merge._('merge'),
  fastForward._('fast-forward'),
  none._('none');

  const MergedUpstreamMergeType._(this.value);

  /// Creates a MergedUpstreamMergeType from a json value.
  factory MergedUpstreamMergeType.fromJson(String json) {
    return MergedUpstreamMergeType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MergedUpstreamMergeType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MergedUpstreamMergeType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MergedUpstreamMergeType.fromJson(json);
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
