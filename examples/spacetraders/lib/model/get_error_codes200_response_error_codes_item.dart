class GetErrorCodes200ResponseErrorCodesItem {
  GetErrorCodes200ResponseErrorCodesItem({
    required this.code,
    required this.name,
  });

  factory GetErrorCodes200ResponseErrorCodesItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetErrorCodes200ResponseErrorCodesItem(
      code: json['code'] as double,
      name: json['name'] as String,
    );
  }

  final double code;
  final String name;

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name};
  }
}
