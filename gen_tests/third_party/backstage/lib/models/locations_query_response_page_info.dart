// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class LocationsQueryResponsePageInfo {
  const LocationsQueryResponsePageInfo({this.nextCursor});

  /// Converts a `Map<String, dynamic>` to a [LocationsQueryResponsePageInfo].
  factory LocationsQueryResponsePageInfo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LocationsQueryResponsePageInfo',
      json,
      () => LocationsQueryResponsePageInfo(
        nextCursor: json['nextCursor'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LocationsQueryResponsePageInfo? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return LocationsQueryResponsePageInfo.fromJson(json);
  }

  /// The cursor for the next batch of locations.
  final String? nextCursor;

  /// Converts a [LocationsQueryResponsePageInfo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'nextCursor': ?nextCursor};
  }

  @override
  int get hashCode => nextCursor.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationsQueryResponsePageInfo &&
        nextCursor == other.nextCursor;
  }
}
