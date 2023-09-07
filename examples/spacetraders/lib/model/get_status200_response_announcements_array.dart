class GetStatus200ResponseAnnouncementsArray {
  GetStatus200ResponseAnnouncementsArray({
    required this.title,
    required this.body,
  });

  factory GetStatus200ResponseAnnouncementsArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseAnnouncementsArray(
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
