import 'package:spacetraders/model/contract.dart';

class GetContract200Response {
  GetContract200Response({required this.data});

  factory GetContract200Response.fromJson(Map<String, dynamic> json) {
    return GetContract200Response(
      data: Contract.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetContract200Response.fromJson(json);
  }

  final Contract data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
