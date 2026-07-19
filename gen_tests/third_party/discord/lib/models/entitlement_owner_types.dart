sealed class EntitlementOwnerTypes {
  const EntitlementOwnerTypes();

  factory EntitlementOwnerTypes.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for EntitlementOwnerTypes: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntitlementOwnerTypes? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return EntitlementOwnerTypes.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
