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

  final String title;
  final String body;

  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body};
  }
}
