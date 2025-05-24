import 'package:spacetraders/model/public_agent.dart';

class GetAgent200Response {
  GetAgent200Response({required this.data});

  factory GetAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetAgent200Response(
      data: PublicAgent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetAgent200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetAgent200Response.fromJson(json);
  }

  final PublicAgent data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
