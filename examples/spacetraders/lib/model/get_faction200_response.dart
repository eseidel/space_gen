import 'package:spacetraders/model/faction.dart';

class GetFaction200Response {
  GetFaction200Response({required this.data});

  factory GetFaction200Response.fromJson(Map<String, dynamic> json) {
    return GetFaction200Response(
      data: Faction.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Faction data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
