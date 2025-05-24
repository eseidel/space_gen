class GetStatus200ResponseAnnouncementsItem {
  GetStatus200ResponseAnnouncementsItem({
    required this.title,
    required this.body,
  });

  factory GetStatus200ResponseAnnouncementsItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseAnnouncementsItem(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseAnnouncementsItem? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseAnnouncementsItem.fromJson(json);
  }

  final String title;
  final String body;

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body};
  }
}
