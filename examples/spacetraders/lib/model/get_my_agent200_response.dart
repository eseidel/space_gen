import 'package:meta/meta.dart';
import 'package:spacetraders/model/agent.dart';

@immutable
class GetMyAgent200Response {
  const GetMyAgent200Response({required this.data});

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

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAgent200Response && data == other.data;
  }
}
