class GetStatus200ResponseAnnouncementsInner {
  GetStatus200ResponseAnnouncementsInner({
    required this.title,
    required this.body,
  });

  factory GetStatus200ResponseAnnouncementsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseAnnouncementsInner(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseAnnouncementsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseAnnouncementsInner.fromJson(json);
  }

  final String title;
  final String body;

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body};
  }
}
