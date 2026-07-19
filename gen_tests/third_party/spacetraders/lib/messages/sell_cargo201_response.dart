import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/sell_cargo201_response_data.dart';

/// {@template sell_cargo201_response}
/// Sell Cargo 201 Response
/// Cargo was successfully sold.
/// {@endtemplate}
@immutable
class SellCargo201Response {
  /// {@macro sell_cargo201_response}
  const SellCargo201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [SellCargo201Response].
  factory SellCargo201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SellCargo201Response',
      json,
      () => SellCargo201Response(
        data: SellCargo201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SellCargo201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SellCargo201Response.fromJson(json);
  }

  final SellCargo201ResponseData data;

  /// Converts a [SellCargo201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SellCargo201Response && data == other.data;
  }
}
