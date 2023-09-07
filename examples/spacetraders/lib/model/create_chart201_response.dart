import 'package:spacetraders/model/chart.dart';
import 'package:spacetraders/model/waypoint.dart';

class CreateChart201Response {
  CreateChart201Response({
    required this.data,
  });

  factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
    return CreateChart201Response(
      data: CreateChart201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateChart201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateChart201ResponseData {
  CreateChart201ResponseData({
    required this.chart,
    required this.waypoint,
  });

  factory CreateChart201ResponseData.fromJson(Map<String, dynamic> json) {
    return CreateChart201ResponseData(
      chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
      waypoint: Waypoint.fromJson(json['waypoint'] as Map<String, dynamic>),
    );
  }

  final Chart chart;
  final Waypoint waypoint;

  Map<String, dynamic> toJson() {
    return {
      'chart': chart.toJson(),
      'waypoint': waypoint.toJson(),
    };
  }
}
