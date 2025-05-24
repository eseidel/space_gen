class GetErrorCodes200ResponseErrorCodesInner {
  GetErrorCodes200ResponseErrorCodesInner({
    required this.code,
    required this.name,
  });

  factory GetErrorCodes200ResponseErrorCodesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetErrorCodes200ResponseErrorCodesInner(
      code: json['code'] as double,
      name: json['name'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetErrorCodes200ResponseErrorCodesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetErrorCodes200ResponseErrorCodesInner.fromJson(json);
  }

  final double code;
  final String name;

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name};
  }
}
