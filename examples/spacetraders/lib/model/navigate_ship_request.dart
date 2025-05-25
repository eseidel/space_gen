import 'package:meta/meta.dart';

@immutable
class NavigateShipRequest {
  const NavigateShipRequest({required this.waypointSymbol});

  factory NavigateShipRequest.fromJson(Map<String, dynamic> json) {
    return NavigateShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NavigateShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NavigateShipRequest.fromJson(json);
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }

  @override
  int get hashCode => waypointSymbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigateShipRequest &&
        waypointSymbol == other.waypointSymbol;
  }
}
