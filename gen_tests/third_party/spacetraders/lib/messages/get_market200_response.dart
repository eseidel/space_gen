import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/market.dart';

/// {@template get_market200_response}
/// Successfully fetched the market.
/// {@endtemplate}
@immutable
class GetMarket200Response {
  /// {@macro get_market200_response}
  const GetMarket200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMarket200Response].
  factory GetMarket200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMarket200Response',
      json,
      () => GetMarket200Response(
        data: Market.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMarket200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMarket200Response.fromJson(json);
  }

  /// Market details.
  final Market data;

  /// Converts a [GetMarket200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMarket200Response && data == other.data;
  }
}
