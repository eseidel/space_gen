class Meta {
  Meta({required this.total, required this.page, required this.limit});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Meta? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Meta.fromJson(json);
  }

  final int total;
  final int page;
  final int limit;

  Map<String, dynamic> toJson() {
    return {'total': total, 'page': page, 'limit': limit};
  }
}
