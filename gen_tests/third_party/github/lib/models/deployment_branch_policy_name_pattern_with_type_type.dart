/// Whether this rule targets a branch or tag
/// Example: `'branch'`
enum DeploymentBranchPolicyNamePatternWithTypeType {
  branch._('branch'),
  tag._('tag');

  const DeploymentBranchPolicyNamePatternWithTypeType._(this.value);

  /// Creates a DeploymentBranchPolicyNamePatternWithTypeType from a json value.
  factory DeploymentBranchPolicyNamePatternWithTypeType.fromJson(String json) {
    return DeploymentBranchPolicyNamePatternWithTypeType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DeploymentBranchPolicyNamePatternWithTypeType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DeploymentBranchPolicyNamePatternWithTypeType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DeploymentBranchPolicyNamePatternWithTypeType.fromJson(json);
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
