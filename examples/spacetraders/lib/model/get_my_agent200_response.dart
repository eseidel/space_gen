import 'package:spacetraders/model/agent.dart';

class GetMyAgent200Response {
  GetMyAgent200Response({required this.data});

  factory GetMyAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAgent200Response(
      data: Agent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAgent200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyAgent200Response.fromJson(json);
  }

  final Agent data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
