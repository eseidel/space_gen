// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The ID of the push protection bypass placeholder. This value is returned on
/// any push protected routes.
extension type const SecretScanningPushProtectionBypassPlaceholderId._(
  String value
) {
  const SecretScanningPushProtectionBypassPlaceholderId(this.value);

  factory SecretScanningPushProtectionBypassPlaceholderId.fromJson(
    String json,
  ) => SecretScanningPushProtectionBypassPlaceholderId(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningPushProtectionBypassPlaceholderId? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningPushProtectionBypassPlaceholderId.fromJson(json);
  }

  String toJson() => value;
}
