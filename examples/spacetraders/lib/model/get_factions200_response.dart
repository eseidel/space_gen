import 'package:spacetraders/model/faction.dart';
import 'package:spacetraders/model/meta.dart';

class GetFactions200Response {
  GetFactions200Response({
    required this.data,
    required this.meta,
  });

  factory GetFactions200Response.fromJson(Map<String, dynamic> json) {
    return GetFactions200Response(
      data: (json['data'] as List<dynamic>)
          .map<Faction>((e) => Faction.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Faction> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
