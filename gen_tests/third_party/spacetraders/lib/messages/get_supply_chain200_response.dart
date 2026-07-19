import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_supply_chain200_response_data.dart';

/// {@template get_supply_chain200_response}
/// Successfully retrieved the supply chain information
/// {@endtemplate}
@immutable
class GetSupplyChain200Response {
  /// {@macro get_supply_chain200_response}
  const GetSupplyChain200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetSupplyChain200Response].
  factory GetSupplyChain200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetSupplyChain200Response',
      json,
      () => GetSupplyChain200Response(
        data: GetSupplyChain200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSupplyChain200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSupplyChain200Response.fromJson(json);
  }

  final GetSupplyChain200ResponseData data;

  /// Converts a [GetSupplyChain200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSupplyChain200Response && data == other.data;
  }
}
