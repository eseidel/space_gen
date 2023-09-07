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

  final String title;
  final String body;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
