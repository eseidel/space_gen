import 'package:spacetraders/model/get_my_account200_response_data.dart';

class GetMyAccount200Response {
  GetMyAccount200Response({required this.data});

  factory GetMyAccount200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200Response(
      data: GetMyAccount200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAccount200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyAccount200Response.fromJson(json);
  }

  final GetMyAccount200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
