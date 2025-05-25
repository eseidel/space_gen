import 'package:meta/meta.dart';
import 'package:spacetraders/model/warp_ship200_response_data.dart';

@immutable
class WarpShip200Response {
  const WarpShip200Response({required this.data});

  factory WarpShip200Response.fromJson(Map<String, dynamic> json) {
    return WarpShip200Response(
      data: WarpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShip200Response.fromJson(json);
  }

  final WarpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WarpShip200Response && data == other.data;
  }
}
