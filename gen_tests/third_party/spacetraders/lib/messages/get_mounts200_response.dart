import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_mount.dart';

/// {@template get_mounts200_response}
/// Get Mounts 200 Response
/// Successfully retrieved ship mounts.
/// {@endtemplate}
@immutable
class GetMounts200Response {
  /// {@macro get_mounts200_response}
  const GetMounts200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMounts200Response].
  factory GetMounts200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMounts200Response',
      json,
      () => GetMounts200Response(
        data: (json['data'] as List)
            .map<ShipMount>(
              (e) => ShipMount.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMounts200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMounts200Response.fromJson(json);
  }

  final List<ShipMount> data;

  /// Converts a [GetMounts200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(data).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMounts200Response && listsEqual(data, other.data);
  }
}
