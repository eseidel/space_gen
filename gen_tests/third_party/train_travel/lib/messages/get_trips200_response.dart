import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/get_trips200_response_all_of_1_data_inner.dart';
import 'package:train_travel/models/get_trips200_response_all_of_2_links.dart';

@immutable
class GetTrips200Response {
  const GetTrips200Response({this.data, this.links});

  /// Converts a `Map<String, dynamic>` to a [GetTrips200Response].
  factory GetTrips200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetTrips200Response',
      json,
      () => GetTrips200Response(
        data: (json['data'] as List?)
            ?.map<GetTrips200ResponseAllOf1DataInner>(
              (e) => GetTrips200ResponseAllOf1DataInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        links: GetTrips200ResponseAllOf2Links.maybeFromJson(
          json['links'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetTrips200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetTrips200Response.fromJson(json);
  }

  final List<GetTrips200ResponseAllOf1DataInner>? data;
  final GetTrips200ResponseAllOf2Links? links;

  /// Converts a [GetTrips200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
      if (links != null) 'links': links?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), links]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetTrips200Response &&
        listsEqual(data, other.data) &&
        links == other.links;
  }
}
