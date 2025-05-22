import 'package:spacetraders/model/ship_mount.dart';

class GetMounts200Response {
  GetMounts200Response({required this.data});

  factory GetMounts200Response.fromJson(Map<String, dynamic> json) {
    return GetMounts200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<ShipMount>(
                (e) => ShipMount.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final List<ShipMount> data;

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}
