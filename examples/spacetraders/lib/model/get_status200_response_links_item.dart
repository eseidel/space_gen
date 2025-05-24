class GetStatus200ResponseLinksItem {
  GetStatus200ResponseLinksItem({required this.name, required this.url});

  factory GetStatus200ResponseLinksItem.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLinksItem(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLinksItem? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLinksItem.fromJson(json);
  }

  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
