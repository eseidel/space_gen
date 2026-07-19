import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/jettison200_response_data.dart';

/// {@template jettison200_response}
/// Jettison successful.
/// {@endtemplate}
@immutable
class Jettison200Response {
  /// {@macro jettison200_response}
  const Jettison200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [Jettison200Response].
  factory Jettison200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Jettison200Response',
      json,
      () => Jettison200Response(
        data: Jettison200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Jettison200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Jettison200Response.fromJson(json);
  }

  final Jettison200ResponseData data;

  /// Converts a [Jettison200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Jettison200Response && data == other.data;
  }
}
