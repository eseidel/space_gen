import 'package:spacetraders/model/jump_gate.dart';

class GetJumpGate200Response {
  GetJumpGate200Response({
    required this.data,
  });

  factory GetJumpGate200Response.fromJson(Map<String, dynamic> json) {
    return GetJumpGate200Response(
      data: JumpGate.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final JumpGate data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
