import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/location.dart';
import 'package:meta/meta.dart';

@immutable
class GetLocations200ResponseInner {
  const GetLocations200ResponseInner({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetLocations200ResponseInner].
  factory GetLocations200ResponseInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetLocations200ResponseInner',
      json,
      () => GetLocations200ResponseInner(
        data: Location.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetLocations200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetLocations200ResponseInner.fromJson(json);
  }

  /// Entity location for a specific entity.
  final Location data;

  /// Converts a [GetLocations200ResponseInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetLocations200ResponseInner && data == other.data;
  }
}
