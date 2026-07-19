/// The color of the issue type.
enum IssueTypeColor {
  gray._('gray'),
  blue._('blue'),
  green._('green'),
  yellow._('yellow'),
  orange._('orange'),
  red._('red'),
  pink._('pink'),
  purple._('purple');

  const IssueTypeColor._(this.value);

  /// Creates a IssueTypeColor from a json value.
  factory IssueTypeColor.fromJson(String json) {
    return IssueTypeColor.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssueTypeColor value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssueTypeColor? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssueTypeColor.fromJson(json);
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
