import 'package:spacetraders/model/get_error_codes200_response_error_codes_item.dart';

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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetErrorCodes200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetErrorCodes200Response.fromJson(json);
  }

  final List<GetErrorCodes200ResponseErrorCodesItem> errorCodes;

  Map<String, dynamic> toJson() {
    return {'errorCodes': errorCodes.map((e) => e.toJson()).toList()};
  }
}
