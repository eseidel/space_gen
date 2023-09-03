import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/src/model/jump_gate.dart';
import 'package:spacetraders/src/model/market.dart';
import 'package:spacetraders/src/model/meta.dart';
import 'package:spacetraders/src/model/shipyard.dart';
import 'package:spacetraders/src/model/system.dart';
import 'package:spacetraders/src/model/waypoint.dart';

class SystemsApi {
  Future<GetSystems200Response> getSystems(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetSystems200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystems');
    }
  }

  Future<GetSystem200Response> getSystem() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetSystem200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystem');
    }
  }

  Future<GetSystemWaypoints200Response> getSystemWaypoints(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetSystemWaypoints200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystemWaypoints');
    }
  }

  Future<GetWaypoint200Response> getWaypoint() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetWaypoint200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getWaypoint');
    }
  }

  Future<GetMarket200Response> getMarket() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/market',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMarket200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMarket');
    }
  }

  Future<GetShipyard200Response> getShipyard() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/shipyard',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetShipyard200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipyard');
    }
  }

  Future<GetJumpGate200Response> getJumpGate() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/jump-gate',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetJumpGate200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getJumpGate');
    }
  }
}

class GetSystems200Response {
  GetSystems200Response({
    required this.data,
    required this.meta,
  });

  factory GetSystems200Response.fromJson(Map<String, dynamic> json) {
    return GetSystems200Response(
      data: (json['data'] as List<dynamic>)
          .map<System>((e) => System.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<System> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GetSystem200Response {
  GetSystem200Response({
    required this.data,
  });

  factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
    return GetSystem200Response(
      data: System.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final System data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetSystemWaypoints200Response {
  GetSystemWaypoints200Response({
    required this.data,
    required this.meta,
  });

  factory GetSystemWaypoints200Response.fromJson(Map<String, dynamic> json) {
    return GetSystemWaypoints200Response(
      data: (json['data'] as List<dynamic>)
          .map<Waypoint>((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Waypoint> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GetWaypoint200Response {
  GetWaypoint200Response({
    required this.data,
  });

  factory GetWaypoint200Response.fromJson(Map<String, dynamic> json) {
    return GetWaypoint200Response(
      data: Waypoint.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Waypoint data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetMarket200Response {
  GetMarket200Response({
    required this.data,
  });

  factory GetMarket200Response.fromJson(Map<String, dynamic> json) {
    return GetMarket200Response(
      data: Market.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Market data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetShipyard200Response {
  GetShipyard200Response({
    required this.data,
  });

  factory GetShipyard200Response.fromJson(Map<String, dynamic> json) {
    return GetShipyard200Response(
      data: Shipyard.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Shipyard data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetJumpGate200Response {
  GetJumpGate200Response({
    required this.data,
  });

  factory GetJumpGate200Response.fromJson(Map<String, dynamic> json) {
    return GetJumpGate200Response(
      data: JumpGate.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final JumpGate data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
