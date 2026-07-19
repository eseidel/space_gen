/// The image provider.
enum ActionsHostedRunnerPoolImageSource {
  github._('github'),
  partner._('partner'),
  custom._('custom');

  const ActionsHostedRunnerPoolImageSource._(this.value);

  /// Creates a ActionsHostedRunnerPoolImageSource from a json value.
  factory ActionsHostedRunnerPoolImageSource.fromJson(String json) {
    return ActionsHostedRunnerPoolImageSource.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ActionsHostedRunnerPoolImageSource value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerPoolImageSource? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerPoolImageSource.fromJson(json);
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
