import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/remove_ship_module201_response_data.dart';

/// {@template remove_ship_module201_response}
/// Successfully removed the module from the ship.
/// {@endtemplate}
@immutable
class RemoveShipModule201Response {
  /// {@macro remove_ship_module201_response}
  const RemoveShipModule201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [RemoveShipModule201Response].
  factory RemoveShipModule201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RemoveShipModule201Response',
      json,
      () => RemoveShipModule201Response(
        data: RemoveShipModule201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveShipModule201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RemoveShipModule201Response.fromJson(json);
  }

  final RemoveShipModule201ResponseData data;

  /// Converts a [RemoveShipModule201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoveShipModule201Response && data == other.data;
  }
}
