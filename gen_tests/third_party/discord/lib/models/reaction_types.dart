enum ReactionTypes {
  /// Normal reaction type
  normal._(0),

  /// Burst reaction type
  burst._(1);

  const ReactionTypes._(this.value);

  /// Creates a ReactionTypes from a json value.
  factory ReactionTypes.fromJson(int json) {
    return ReactionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ReactionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ReactionTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
