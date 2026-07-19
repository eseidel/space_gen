import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/supply_construction201_response_data.dart';

/// {@template supply_construction201_response}
/// Successfully supplied construction site.
/// {@endtemplate}
@immutable
class SupplyConstruction201Response {
  /// {@macro supply_construction201_response}
  const SupplyConstruction201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [SupplyConstruction201Response].
  factory SupplyConstruction201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SupplyConstruction201Response',
      json,
      () => SupplyConstruction201Response(
        data: SupplyConstruction201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
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

  /// Converts a [SupplyConstruction201Response] to a `Map<String, dynamic>`.
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
