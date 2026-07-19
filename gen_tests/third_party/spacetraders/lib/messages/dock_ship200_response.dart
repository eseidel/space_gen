import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/dock_ship200_response_data.dart';

/// {@template dock_ship200_response}
/// Dock Ship 200 Response
/// The ship has successfully docked at its current location.
/// {@endtemplate}
@immutable
class DockShip200Response {
  /// {@macro dock_ship200_response}
  const DockShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [DockShip200Response].
  factory DockShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DockShip200Response',
      json,
      () => DockShip200Response(
        data: DockShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DockShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DockShip200Response.fromJson(json);
  }

  final DockShip200ResponseData data;

  /// Converts a [DockShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DockShip200Response && data == other.data;
  }
}
