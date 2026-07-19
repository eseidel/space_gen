import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/install_ship_module201_response_data.dart';

/// {@template install_ship_module201_response}
/// Successfully installed the module on the ship.
/// {@endtemplate}
@immutable
class InstallShipModule201Response {
  /// {@macro install_ship_module201_response}
  const InstallShipModule201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an [InstallShipModule201Response].
  factory InstallShipModule201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallShipModule201Response',
      json,
      () => InstallShipModule201Response(
        data: InstallShipModule201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallShipModule201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InstallShipModule201Response.fromJson(json);
  }

  final InstallShipModule201ResponseData data;

  /// Converts an [InstallShipModule201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallShipModule201Response && data == other.data;
  }
}
