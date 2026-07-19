import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/jump_ship200_response_data.dart';

/// {@template jump_ship200_response}
/// Jump successful.
/// {@endtemplate}
@immutable
class JumpShip200Response {
  /// {@macro jump_ship200_response}
  const JumpShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [JumpShip200Response].
  factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JumpShip200Response',
      json,
      () => JumpShip200Response(
        data: JumpShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JumpShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JumpShip200Response.fromJson(json);
  }

  final JumpShip200ResponseData data;

  /// Converts a [JumpShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JumpShip200Response && data == other.data;
  }
}
