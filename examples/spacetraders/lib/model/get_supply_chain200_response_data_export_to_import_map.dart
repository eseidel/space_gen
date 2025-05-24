class GetSupplyChain200ResponseDataExportToImportMap {
  GetSupplyChain200ResponseDataExportToImportMap({
    required this.additionalProperties,
  });

  factory GetSupplyChain200ResponseDataExportToImportMap.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetSupplyChain200ResponseDataExportToImportMap(
      additionalProperties: json.map(
        (key, value) => MapEntry(key, (value as List<dynamic>).cast<String>()),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSupplyChain200ResponseDataExportToImportMap? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetSupplyChain200ResponseDataExportToImportMap.fromJson(json);
  }

  final Map<String, List<String>> additionalProperties;

  List<String>? operator [](String key) => additionalProperties[key];

  Map<String, dynamic> toJson() {
    return {...additionalProperties.map(MapEntry.new)};
  }
}
