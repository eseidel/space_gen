import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_refine201_response_data.dart';

/// {@template ship_refine201_response}
/// Ship Refine 201 Response
/// The ship has successfully refined goods.
/// {@endtemplate}
@immutable
class ShipRefine201Response {
  /// {@macro ship_refine201_response}
  const ShipRefine201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [ShipRefine201Response].
  factory ShipRefine201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipRefine201Response',
      json,
      () => ShipRefine201Response(
        data: ShipRefine201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipRefine201Response.fromJson(json);
  }

  final ShipRefine201ResponseData data;

  /// Converts a [ShipRefine201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRefine201Response && data == other.data;
  }
}
