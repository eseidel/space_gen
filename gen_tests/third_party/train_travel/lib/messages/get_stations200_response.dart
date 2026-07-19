import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/get_stations200_response_all_of_2_links.dart';
import 'package:train_travel/models/station.dart';

@immutable
class GetStations200Response {
  const GetStations200Response({this.data, this.links});

  /// Converts a `Map<String, dynamic>` to a [GetStations200Response].
  factory GetStations200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStations200Response',
      json,
      () => GetStations200Response(
        data: (json['data'] as List?)
            ?.map<Station>((e) => Station.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: GetStations200ResponseAllOf2Links.maybeFromJson(
          json['links'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStations200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetStations200Response.fromJson(json);
  }

  final List<Station>? data;
  final GetStations200ResponseAllOf2Links? links;

  /// Converts a [GetStations200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'data': ?data?.map((e) => e.toJson()).toList(),
      'links': ?links?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), links]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStations200Response &&
        listsEqual(data, other.data) &&
        links == other.links;
  }
}
