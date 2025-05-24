import 'package:spacetraders/model/system.dart';

class GetSystem200Response {
  GetSystem200Response({required this.data});

  factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
    return GetSystem200Response(
      data: System.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSystem200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSystem200Response.fromJson(json);
  }

  final System data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
