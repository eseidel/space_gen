import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/ship.dart';

class GetMyShips200Response {
  GetMyShips200Response({
    required this.data,
    required this.meta,
  });

  factory GetMyShips200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShips200Response(
      data: (json['data'] as List<dynamic>)
          .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Ship> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
