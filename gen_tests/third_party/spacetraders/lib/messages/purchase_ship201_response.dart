import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/purchase_ship201_response_data.dart';

/// {@template purchase_ship201_response}
/// Purchased ship successfully.
/// {@endtemplate}
@immutable
class PurchaseShip201Response {
  /// {@macro purchase_ship201_response}
  const PurchaseShip201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [PurchaseShip201Response].
  factory PurchaseShip201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseShip201Response',
      json,
      () => PurchaseShip201Response(
        data: PurchaseShip201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseShip201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseShip201Response.fromJson(json);
  }

  final PurchaseShip201ResponseData data;

  /// Converts a [PurchaseShip201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseShip201Response && data == other.data;
  }
}
