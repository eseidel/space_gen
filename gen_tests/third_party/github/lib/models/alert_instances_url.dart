/// The REST API URL for fetching the list of instances for an alert.
extension type const AlertInstancesUrl._(Uri value) {
  const AlertInstancesUrl(this.value);

  factory AlertInstancesUrl.fromJson(String json) =>
      AlertInstancesUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertInstancesUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertInstancesUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
