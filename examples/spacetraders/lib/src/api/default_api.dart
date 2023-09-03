import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/agent.dart';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/faction.dart';
import 'package:spacetraders/src/model/ship.dart';

class DefaultApi {
    Future<GetStatus200Response> GetStatus(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetStatus200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetStatus');
        }
    }
    Future<Register201Response> Register(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/register'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return Register201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load Register');
        }
    }
}

class GetStatus200Response {
    GetStatus200Response(
        { 
        required this.status,
        required this.version,
        required this.resetDate,
        required this.description,
        required this.stats,
        required this.leaderboards,
        required this.serverResets,
        required this.announcements,
        required this.links,
         }
    );

    final String status;
    final String version;
    final String resetDate;
    final String description;
    final SpaceTradersstats stats;
    final SpaceTradersleaderboards leaderboards;
    final SpaceTradersserverResets serverResets;
    final List<SpaceTradersItem> announcements;
    final List<SpaceTradersItem> links;

    factory GetStatus200Response.fromJson(Map<String, dynamic> json) {
        return GetStatus200Response(
            status: json['status'],
            version: json['version'],
            resetDate: json['resetDate'],
            description: json['description'],
            stats: json['stats'],
            leaderboards: json['leaderboards'],
            serverResets: json['serverResets'],
            announcements: json['announcements'],
            links: json['links'],
        );
    }
}class SpaceTradersstats {
    SpaceTradersstats(
        { 
        required this.agents,
        required this.ships,
        required this.systems,
        required this.waypoints,
         }
    );

    final int agents;
    final int ships;
    final int systems;
    final int waypoints;

    factory SpaceTradersstats.fromJson(Map<String, dynamic> json) {
        return SpaceTradersstats(
            agents: json['agents'],
            ships: json['ships'],
            systems: json['systems'],
            waypoints: json['waypoints'],
        );
    }
}class SpaceTradersleaderboards {
    SpaceTradersleaderboards(
        { 
        required this.mostCredits,
        required this.mostSubmittedCharts,
         }
    );

    final List<SpaceTradersItem> mostCredits;
    final List<SpaceTradersItem> mostSubmittedCharts;

    factory SpaceTradersleaderboards.fromJson(Map<String, dynamic> json) {
        return SpaceTradersleaderboards(
            mostCredits: json['mostCredits'],
            mostSubmittedCharts: json['mostSubmittedCharts'],
        );
    }
}class SpaceTradersItem {
    SpaceTradersItem(
        { 
        required this.agentSymbol,
        required this.credits,
         }
    );

    final String agentSymbol;
    final int credits;

    factory SpaceTradersItem.fromJson(Map<String, dynamic> json) {
        return SpaceTradersItem(
            agentSymbol: json['agentSymbol'],
            credits: json['credits'],
        );
    }
}class SpaceTradersItem {
    SpaceTradersItem(
        { 
        required this.agentSymbol,
        required this.chartCount,
         }
    );

    final String agentSymbol;
    final int chartCount;

    factory SpaceTradersItem.fromJson(Map<String, dynamic> json) {
        return SpaceTradersItem(
            agentSymbol: json['agentSymbol'],
            chartCount: json['chartCount'],
        );
    }
}class SpaceTradersserverResets {
    SpaceTradersserverResets(
        { 
        required this.next,
        required this.frequency,
         }
    );

    final String next;
    final String frequency;

    factory SpaceTradersserverResets.fromJson(Map<String, dynamic> json) {
        return SpaceTradersserverResets(
            next: json['next'],
            frequency: json['frequency'],
        );
    }
}class SpaceTradersItem {
    SpaceTradersItem(
        { 
        required this.title,
        required this.body,
         }
    );

    final String title;
    final String body;

    factory SpaceTradersItem.fromJson(Map<String, dynamic> json) {
        return SpaceTradersItem(
            title: json['title'],
            body: json['body'],
        );
    }
}class SpaceTradersItem {
    SpaceTradersItem(
        { 
        required this.name,
        required this.url,
         }
    );

    final String name;
    final String url;

    factory SpaceTradersItem.fromJson(Map<String, dynamic> json) {
        return SpaceTradersItem(
            name: json['name'],
            url: json['url'],
        );
    }
}class Register201Response {
    Register201Response(
        { 
        required this.data,
         }
    );

    final SpaceTradersdata data;

    factory Register201Response.fromJson(Map<String, dynamic> json) {
        return Register201Response(
            data: json['data'],
        );
    }
}class SpaceTradersdata {
    SpaceTradersdata(
        { 
        required this.agent,
        required this.contract,
        required this.faction,
        required this.ship,
        required this.token,
         }
    );

    final Agent agent;
    final Contract contract;
    final Faction faction;
    final Ship ship;
    final String token;

    factory SpaceTradersdata.fromJson(Map<String, dynamic> json) {
        return SpaceTradersdata(
            agent: json['agent'],
            contract: json['contract'],
            faction: json['faction'],
            ship: json['ship'],
            token: json['token'],
        );
    }
}