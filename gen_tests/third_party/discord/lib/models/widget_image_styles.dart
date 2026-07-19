enum WidgetImageStyles {
  /// shield style widget with Discord icon and guild members online count
  shield._('shield'),

  /// large image with guild icon, name and online count. "POWERED BY DISCORD"
  /// as the footer of the widget
  banner1._('banner1'),

  /// smaller widget style with guild icon, name and online count. Split on
  /// the right with Discord logo
  banner2._('banner2'),

  /// large image with guild icon, name and online count. In the footer,
  /// Discord logo on the left and "Chat Now" on the right
  banner3._('banner3'),

  /// large Discord logo at the top of the widget. Guild icon, name and online
  /// count in the middle portion of the widget and a "JOIN MY SERVER" button
  /// at the bottom
  banner4._('banner4');

  const WidgetImageStyles._(this.value);

  /// Creates a WidgetImageStyles from a json value.
  factory WidgetImageStyles.fromJson(String json) {
    return WidgetImageStyles.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown WidgetImageStyles value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WidgetImageStyles? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WidgetImageStyles.fromJson(json);
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
