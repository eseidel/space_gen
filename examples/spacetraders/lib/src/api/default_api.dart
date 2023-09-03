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
    final GetStatus200ResponseStats stats;
    final GetStatus200ResponseLeaderboards leaderboards;
    final GetStatus200ResponseServerResets serverResets;
    final List<GetStatus200ResponseAnnouncementsArrayArray> announcements;
    final List<GetStatus200ResponseLinksArrayArray> links;

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
}class GetStatus200ResponseStats {
    GetStatus200ResponseStats(
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

    factory GetStatus200ResponseStats.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseStats(
            agents: json['agents'],
            ships: json['ships'],
            systems: json['systems'],
            waypoints: json['waypoints'],
        );
    }
}class GetStatus200ResponseLeaderboards {
    GetStatus200ResponseLeaderboards(
        { 
        required this.mostCredits,
        required this.mostSubmittedCharts,
         }
    );

    final List<GetStatus200ResponseLeaderboardsMostCreditsArrayArray> mostCredits;
    final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsArrayArray> mostSubmittedCharts;

    factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboards(
            mostCredits: json['mostCredits'],
            mostSubmittedCharts: json['mostSubmittedCharts'],
        );
    }
}class GetStatus200ResponseLeaderboardsMostCreditsArrayArray {
    GetStatus200ResponseLeaderboardsMostCreditsArrayArray(
        { 
        required this.agentSymbol,
        required this.credits,
         }
    );

    final String agentSymbol;
    final int credits;

    factory GetStatus200ResponseLeaderboardsMostCreditsArrayArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboardsMostCreditsArrayArray(
            agentSymbol: json['agentSymbol'],
            credits: json['credits'],
        );
    }
}class GetStatus200ResponseLeaderboardsMostSubmittedChartsArrayArray {
    GetStatus200ResponseLeaderboardsMostSubmittedChartsArrayArray(
        { 
        required this.agentSymbol,
        required this.chartCount,
         }
    );

    final String agentSymbol;
    final int chartCount;

    factory GetStatus200ResponseLeaderboardsMostSubmittedChartsArrayArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboardsMostSubmittedChartsArrayArray(
            agentSymbol: json['agentSymbol'],
            chartCount: json['chartCount'],
        );
    }
}class GetStatus200ResponseServerResets {
    GetStatus200ResponseServerResets(
        { 
        required this.next,
        required this.frequency,
         }
    );

    final String next;
    final String frequency;

    factory GetStatus200ResponseServerResets.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseServerResets(
            next: json['next'],
            frequency: json['frequency'],
        );
    }
}class GetStatus200ResponseAnnouncementsArrayArray {
    GetStatus200ResponseAnnouncementsArrayArray(
        { 
        required this.title,
        required this.body,
         }
    );

    final String title;
    final String body;

    factory GetStatus200ResponseAnnouncementsArrayArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseAnnouncementsArrayArray(
            title: json['title'],
            body: json['body'],
        );
    }
}class GetStatus200ResponseLinksArrayArray {
    GetStatus200ResponseLinksArrayArray(
        { 
        required this.name,
        required this.url,
         }
    );

    final String name;
    final String url;

    factory GetStatus200ResponseLinksArrayArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLinksArrayArray(
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

    final Register201ResponseData data;

    factory Register201Response.fromJson(Map<String, dynamic> json) {
        return Register201Response(
            data: json['data'],
        );
    }
}class Register201ResponseData {
    Register201ResponseData(
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

    factory Register201ResponseData.fromJson(Map<String, dynamic> json) {
        return Register201ResponseData(
            agent: json['agent'],
            contract: json['contract'],
            faction: json['faction'],
            ship: json['ship'],
            token: json['token'],
        );
    }
}