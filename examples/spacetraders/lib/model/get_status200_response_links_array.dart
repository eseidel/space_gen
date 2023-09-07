class GetStatus200ResponseLinksArray {
  GetStatus200ResponseLinksArray({
    required this.name,
    required this.url,
  });

  factory GetStatus200ResponseLinksArray.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLinksArray(
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
