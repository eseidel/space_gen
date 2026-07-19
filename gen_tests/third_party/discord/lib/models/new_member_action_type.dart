enum NewMemberActionType {
  view._(0),
  talk._(1);

  const NewMemberActionType._(this.value);

  /// Creates a NewMemberActionType from a json value.
  factory NewMemberActionType.fromJson(int json) {
    return NewMemberActionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown NewMemberActionType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static NewMemberActionType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return NewMemberActionType.fromJson(json);
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
