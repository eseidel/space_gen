import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_module.dart';

/// {@template get_ship_modules200_response}
/// Successfully retrieved ship modules.
/// {@endtemplate}
@immutable
class GetShipModules200Response {
  /// {@macro get_ship_modules200_response}
  const GetShipModules200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetShipModules200Response].
  factory GetShipModules200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetShipModules200Response',
      json,
      () => GetShipModules200Response(
        data: (json['data'] as List)
            .map<ShipModule>(
              (e) => ShipModule.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipModules200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipModules200Response.fromJson(json);
  }

  final List<ShipModule> data;

  /// Converts a [GetShipModules200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(data).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipModules200Response && listsEqual(data, other.data);
  }
}
