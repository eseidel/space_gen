class Meta {
  Meta({required this.total, this.page = 1, this.limit = 10});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
    );
  }

  final int total;
  final int page;
  final int limit;

  Map<String, dynamic> toJson() {
    return {'total': total, 'page': page, 'limit': limit};
  }
}
