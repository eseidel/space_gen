import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/purchase_cargo201_response_data.dart';

/// {@template purchase_cargo201_response}
/// Purchase Cargo 201 Response
/// Purchased goods successfully.
/// {@endtemplate}
@immutable
class PurchaseCargo201Response {
  /// {@macro purchase_cargo201_response}
  const PurchaseCargo201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [PurchaseCargo201Response].
  factory PurchaseCargo201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseCargo201Response',
      json,
      () => PurchaseCargo201Response(
        data: PurchaseCargo201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseCargo201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseCargo201Response.fromJson(json);
  }

  final PurchaseCargo201ResponseData data;

  /// Converts a [PurchaseCargo201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseCargo201Response && data == other.data;
  }
}
