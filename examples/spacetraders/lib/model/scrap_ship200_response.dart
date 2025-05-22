import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/scrap_transaction.dart';

class ScrapShip200Response {
  ScrapShip200Response({required this.data});

  factory ScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return ScrapShip200Response(
      data: ScrapShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ScrapShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class ScrapShip200ResponseData {
  ScrapShip200ResponseData({required this.agent, required this.transaction});

  factory ScrapShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return ScrapShip200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      transaction: ScrapTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ScrapTransaction transaction;

  Map<String, dynamic> toJson() {
    return {'agent': agent.toJson(), 'transaction': transaction.toJson()};
  }
}
