/// The organization policy for allowing or disallowing Copilot features on
/// GitHub.com.
enum CopilotOrganizationDetailsPlatformChat {
  enabled._('enabled'),
  disabled._('disabled'),
  unconfigured._('unconfigured');

  const CopilotOrganizationDetailsPlatformChat._(this.value);

  /// Creates a CopilotOrganizationDetailsPlatformChat from a json value.
  factory CopilotOrganizationDetailsPlatformChat.fromJson(String json) {
    return CopilotOrganizationDetailsPlatformChat.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CopilotOrganizationDetailsPlatformChat value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CopilotOrganizationDetailsPlatformChat? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CopilotOrganizationDetailsPlatformChat.fromJson(json);
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
