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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetStatus200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return Register201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
    final List<GetStatus200ResponseAnnouncementsArray> announcements;
    final List<GetStatus200ResponseLinksArray> links;

    factory GetStatus200Response.fromJson(Map<String, dynamic> json) {
        return GetStatus200Response(
            status: json['status'] as String,
            version: json['version'] as String,
            resetDate: json['resetDate'] as String,
            description: json['description'] as String,
            stats: GetStatus200ResponseStats.fromJson(json['stats'] as Map<String, dynamic>),
            leaderboards: GetStatus200ResponseLeaderboards.fromJson(json['leaderboards'] as Map<String, dynamic>),
            serverResets: GetStatus200ResponseServerResets.fromJson(json['serverResets'] as Map<String, dynamic>),
            announcements: (json['announcements'] as List<dynamic>).map<GetStatus200ResponseAnnouncementsArray>((e) => GetStatus200ResponseAnnouncementsArray.fromJson(e as Map<String, dynamic>)).toList(),
            links: (json['links'] as List<dynamic>).map<GetStatus200ResponseLinksArray>((e) => GetStatus200ResponseLinksArray.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'status': this.status,
            'version': this.version,
            'resetDate': this.resetDate,
            'description': this.description,
            'stats': this.stats.toJson(),
            'leaderboards': this.leaderboards.toJson(),
            'serverResets': this.serverResets.toJson(),
            'announcements': this.announcements.map((e) => e.toJson()).toList(),
            'links': this.links.map((e) => e.toJson()).toList(),
        };
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
            agents: json['agents'] as int,
            ships: json['ships'] as int,
            systems: json['systems'] as int,
            waypoints: json['waypoints'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agents': this.agents,
            'ships': this.ships,
            'systems': this.systems,
            'waypoints': this.waypoints,
        };
    }
}class GetStatus200ResponseLeaderboards {
    GetStatus200ResponseLeaderboards(
        { 
        required this.mostCredits,
        required this.mostSubmittedCharts,
         }
    );

    final List<GetStatus200ResponseLeaderboardsMostCreditsArray> mostCredits;
    final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsArray> mostSubmittedCharts;

    factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboards(
            mostCredits: (json['mostCredits'] as List<dynamic>).map<GetStatus200ResponseLeaderboardsMostCreditsArray>((e) => GetStatus200ResponseLeaderboardsMostCreditsArray.fromJson(e as Map<String, dynamic>)).toList(),
            mostSubmittedCharts: (json['mostSubmittedCharts'] as List<dynamic>).map<GetStatus200ResponseLeaderboardsMostSubmittedChartsArray>((e) => GetStatus200ResponseLeaderboardsMostSubmittedChartsArray.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'mostCredits': this.mostCredits.map((e) => e.toJson()).toList(),
            'mostSubmittedCharts': this.mostSubmittedCharts.map((e) => e.toJson()).toList(),
        };
    }
}class GetStatus200ResponseLeaderboardsMostCreditsArray {
    GetStatus200ResponseLeaderboardsMostCreditsArray(
        { 
        required this.agentSymbol,
        required this.credits,
         }
    );

    final String agentSymbol;
    final int credits;

    factory GetStatus200ResponseLeaderboardsMostCreditsArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboardsMostCreditsArray(
            agentSymbol: json['agentSymbol'] as String,
            credits: json['credits'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agentSymbol': this.agentSymbol,
            'credits': this.credits,
        };
    }
}class GetStatus200ResponseLeaderboardsMostSubmittedChartsArray {
    GetStatus200ResponseLeaderboardsMostSubmittedChartsArray(
        { 
        required this.agentSymbol,
        required this.chartCount,
         }
    );

    final String agentSymbol;
    final int chartCount;

    factory GetStatus200ResponseLeaderboardsMostSubmittedChartsArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLeaderboardsMostSubmittedChartsArray(
            agentSymbol: json['agentSymbol'] as String,
            chartCount: json['chartCount'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agentSymbol': this.agentSymbol,
            'chartCount': this.chartCount,
        };
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
            next: json['next'] as String,
            frequency: json['frequency'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'next': this.next,
            'frequency': this.frequency,
        };
    }
}class GetStatus200ResponseAnnouncementsArray {
    GetStatus200ResponseAnnouncementsArray(
        { 
        required this.title,
        required this.body,
         }
    );

    final String title;
    final String body;

    factory GetStatus200ResponseAnnouncementsArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseAnnouncementsArray(
            title: json['title'] as String,
            body: json['body'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'title': this.title,
            'body': this.body,
        };
    }
}class GetStatus200ResponseLinksArray {
    GetStatus200ResponseLinksArray(
        { 
        required this.name,
        required this.url,
         }
    );

    final String name;
    final String url;

    factory GetStatus200ResponseLinksArray.fromJson(Map<String, dynamic> json) {
        return GetStatus200ResponseLinksArray(
            name: json['name'] as String,
            url: json['url'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'name': this.name,
            'url': this.url,
        };
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
            data: Register201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
            faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
            ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
            token: json['token'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'contract': this.contract.toJson(),
            'faction': this.faction.toJson(),
            'ship': this.ship.toJson(),
            'token': this.token,
        };
    }
}