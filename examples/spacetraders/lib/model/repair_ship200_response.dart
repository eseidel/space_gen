import 'package:meta/meta.dart';
import 'package:spacetraders/model/repair_ship200_response_data.dart';

@immutable
class RepairShip200Response {
  const RepairShip200Response({required this.data});

  factory RepairShip200Response.fromJson(Map<String, dynamic> json) {
    return RepairShip200Response(
      data: RepairShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepairShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepairShip200Response.fromJson(json);
  }

  final RepairShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepairShip200Response && data == other.data;
  }
}
