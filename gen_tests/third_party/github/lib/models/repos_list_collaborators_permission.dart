enum ReposListCollaboratorsPermission {
  pull._('pull'),
  triage._('triage'),
  push._('push'),
  maintain._('maintain'),
  admin._('admin');

  const ReposListCollaboratorsPermission._(this.value);

  /// Creates a ReposListCollaboratorsPermission from a json value.
  factory ReposListCollaboratorsPermission.fromJson(String json) {
    return ReposListCollaboratorsPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListCollaboratorsPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListCollaboratorsPermission? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListCollaboratorsPermission.fromJson(json);
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
