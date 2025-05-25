import 'package:meta/meta.dart';
import 'package:spacetraders/model/market.dart';

@immutable
class GetMarket200Response {
  const GetMarket200Response({required this.data});

  factory GetMarket200Response.fromJson(Map<String, dynamic> json) {
    return GetMarket200Response(
      data: Market.fromJson(json['data'] as Map<String, dynamic>),
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

  final Market data;

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
