import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_nav.dart';

@immutable
class GetShipNav200Response {
  const GetShipNav200Response({required this.data});

  factory GetShipNav200Response.fromJson(Map<String, dynamic> json) {
    return GetShipNav200Response(
      data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipNav200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipNav200Response.fromJson(json);
  }

  final ShipNav data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipNav200Response && data == other.data;
  }
}
