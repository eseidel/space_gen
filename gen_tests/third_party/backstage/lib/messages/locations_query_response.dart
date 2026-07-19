import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/location.dart';
import 'package:backstage/models/locations_query_response_page_info.dart';
import 'package:meta/meta.dart';

@immutable
class LocationsQueryResponse {
  const LocationsQueryResponse({
    required this.items,
    required this.totalItems,
    required this.pageInfo,
  });

  /// Converts a `Map<String, dynamic>` to a [LocationsQueryResponse].
  factory LocationsQueryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LocationsQueryResponse',
      json,
      () => LocationsQueryResponse(
        items: (json['items'] as List)
            .map<Location>((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalItems: (json['totalItems'] as num).toDouble(),
        pageInfo: LocationsQueryResponsePageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LocationsQueryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LocationsQueryResponse.fromJson(json);
  }

  /// The list of locations paginated by a specific query.
  final List<Location> items;
  final double totalItems;
  final LocationsQueryResponsePageInfo pageInfo;

  /// Converts a [LocationsQueryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'totalItems': totalItems,
      'pageInfo': pageInfo.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(items), totalItems, pageInfo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationsQueryResponse &&
        listsEqual(items, other.items) &&
        totalItems == other.totalItems &&
        pageInfo == other.pageInfo;
  }
}
