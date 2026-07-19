import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/jump_gate.dart';

/// {@template get_jump_gate200_response}
/// Jump gate details retrieved successfully.
/// {@endtemplate}
@immutable
class GetJumpGate200Response {
  /// {@macro get_jump_gate200_response}
  const GetJumpGate200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetJumpGate200Response].
  factory GetJumpGate200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetJumpGate200Response',
      json,
      () => GetJumpGate200Response(
        data: JumpGate.fromJson(json['data'] as Map<String, dynamic>),
      ),
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

  /// Details of a jump gate waypoint.
  final JumpGate data;

  /// Converts a [GetJumpGate200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetJumpGate200Response && data == other.data;
  }
}
