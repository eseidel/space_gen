import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/src/model/faction.dart';
import 'package:spacetraders/src/model/meta.dart';

class FactionsApi {
  Future<GetFactions200Response> getFactions(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/factions'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getFactions');
    }
  }

  Future<GetFaction200Response> getFaction() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/factions/%7BfactionSymbol%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetFaction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getFaction');
    }
  }
}

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

class GetFaction200Response {
  GetFaction200Response({
    required this.data,
  });

  factory GetFaction200Response.fromJson(Map<String, dynamic> json) {
    return GetFaction200Response(
      data: Faction.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Faction data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
