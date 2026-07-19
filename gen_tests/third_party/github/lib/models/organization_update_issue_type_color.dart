/// Color for the issue type.
enum OrganizationUpdateIssueTypeColor {
  gray._('gray'),
  blue._('blue'),
  green._('green'),
  yellow._('yellow'),
  orange._('orange'),
  red._('red'),
  pink._('pink'),
  purple._('purple');

  const OrganizationUpdateIssueTypeColor._(this.value);

  /// Creates a OrganizationUpdateIssueTypeColor from a json value.
  factory OrganizationUpdateIssueTypeColor.fromJson(String json) {
    return OrganizationUpdateIssueTypeColor.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrganizationUpdateIssueTypeColor value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrganizationUpdateIssueTypeColor? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrganizationUpdateIssueTypeColor.fromJson(json);
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
