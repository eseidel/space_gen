class GetErrorCodes200Response {
  GetErrorCodes200Response({required this.errorCodes});

  factory GetErrorCodes200Response.fromJson(Map<String, dynamic> json) {
    return GetErrorCodes200Response(
      errorCodes:
          (json['errorCodes'] as List<dynamic>)
              .map<GetErrorCodes200ResponseErrorCodesItem>(
                (e) => GetErrorCodes200ResponseErrorCodesItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  final List<GetErrorCodes200ResponseErrorCodesItem> errorCodes;

  Map<String, dynamic> toJson() {
    return {'errorCodes': errorCodes.map((e) => e.toJson()).toList()};
  }
}

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
