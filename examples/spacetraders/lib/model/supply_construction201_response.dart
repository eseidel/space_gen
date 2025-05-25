import 'package:meta/meta.dart';
import 'package:spacetraders/model/supply_construction201_response_data.dart';

@immutable
class SupplyConstruction201Response {
  const SupplyConstruction201Response({required this.data});

  factory SupplyConstruction201Response.fromJson(Map<String, dynamic> json) {
    return SupplyConstruction201Response(
      data: SupplyConstruction201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SupplyConstruction201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SupplyConstruction201Response.fromJson(json);
  }

  final SupplyConstruction201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SupplyConstruction201Response && data == other.data;
  }
}
