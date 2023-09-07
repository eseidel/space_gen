class GetStatus200ResponseLinksInner {
  GetStatus200ResponseLinksInner({
    required this.name,
    required this.url,
  });

  factory GetStatus200ResponseLinksInner.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLinksInner(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
