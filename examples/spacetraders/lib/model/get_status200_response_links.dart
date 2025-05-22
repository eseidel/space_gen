class GetStatus200ResponseLinks {
  GetStatus200ResponseLinks({required this.name, required this.url});

  factory GetStatus200ResponseLinks.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLinks(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
