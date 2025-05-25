import 'package:meta/meta.dart';
import 'package:spacetraders/model/patch_ship_nav200_response_data.dart';

@immutable
class PatchShipNav200Response {
  const PatchShipNav200Response({required this.data});

  factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
    return PatchShipNav200Response(
      data: PatchShipNav200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PatchShipNav200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PatchShipNav200Response.fromJson(json);
  }

  final PatchShipNav200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatchShipNav200Response && data == other.data;
  }
}
