import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/construction.dart';

/// {@template get_construction200_response}
/// Successfully fetched construction site.
/// {@endtemplate}
@immutable
class GetConstruction200Response {
  /// {@macro get_construction200_response}
  const GetConstruction200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetConstruction200Response].
  factory GetConstruction200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetConstruction200Response',
      json,
      () => GetConstruction200Response(
        data: Construction.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetConstruction200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetConstruction200Response.fromJson(json);
  }

  /// The construction details of a waypoint.
  final Construction data;

  /// Converts a [GetConstruction200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetConstruction200Response && data == other.data;
  }
}
