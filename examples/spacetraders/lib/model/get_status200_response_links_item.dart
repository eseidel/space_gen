class GetStatus200ResponseLinksItem {
  GetStatus200ResponseLinksItem({required this.name, required this.url});

  factory GetStatus200ResponseLinksItem.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLinksItem(
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
