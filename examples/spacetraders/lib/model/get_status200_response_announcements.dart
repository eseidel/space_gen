class GetStatus200ResponseAnnouncements {
  GetStatus200ResponseAnnouncements({required this.title, required this.body});

  factory GetStatus200ResponseAnnouncements.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseAnnouncements(
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
