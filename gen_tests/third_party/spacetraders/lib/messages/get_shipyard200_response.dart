import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/shipyard.dart';

/// {@template get_shipyard200_response}
/// Successfully fetched the shipyard.
/// {@endtemplate}
@immutable
class GetShipyard200Response {
  /// {@macro get_shipyard200_response}
  const GetShipyard200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetShipyard200Response].
  factory GetShipyard200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetShipyard200Response',
      json,
      () => GetShipyard200Response(
        data: Shipyard.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipyard200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipyard200Response.fromJson(json);
  }

  /// Shipyard details.
  final Shipyard data;

  /// Converts a [GetShipyard200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipyard200Response && data == other.data;
  }
}
