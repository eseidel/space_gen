import 'package:spacetraders/model/jump_gate.dart';

class GetJumpGate200Response {
  GetJumpGate200Response({required this.data});

  factory GetJumpGate200Response.fromJson(Map<String, dynamic> json) {
    return GetJumpGate200Response(
      data: JumpGate.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetJumpGate200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetJumpGate200Response.fromJson(json);
  }

  final JumpGate data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
