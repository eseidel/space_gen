import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';

@immutable
class GetShipCooldown200Response {
  const GetShipCooldown200Response({required this.data});

  factory GetShipCooldown200Response.fromJson(Map<String, dynamic> json) {
    return GetShipCooldown200Response(
      data: Cooldown.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipCooldown200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipCooldown200Response.fromJson(json);
  }

  final Cooldown data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipCooldown200Response && data == other.data;
  }
}
