import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EntitiesQueryResponsePageInfo {
  const EntitiesQueryResponsePageInfo({this.nextCursor, this.prevCursor});

  /// Converts a `Map<String, dynamic>` to an [EntitiesQueryResponsePageInfo].
  factory EntitiesQueryResponsePageInfo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntitiesQueryResponsePageInfo',
      json,
      () => EntitiesQueryResponsePageInfo(
        nextCursor: json['nextCursor'] as String?,
        prevCursor: json['prevCursor'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntitiesQueryResponsePageInfo? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EntitiesQueryResponsePageInfo.fromJson(json);
  }

  /// The cursor for the next batch of entities.
  final String? nextCursor;

  /// The cursor for the previous batch of entities.
  final String? prevCursor;

  /// Converts an [EntitiesQueryResponsePageInfo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (nextCursor != null) 'nextCursor': nextCursor,
      if (prevCursor != null) 'prevCursor': prevCursor,
    };
  }

  @override
  int get hashCode => Object.hashAll([nextCursor, prevCursor]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntitiesQueryResponsePageInfo &&
        nextCursor == other.nextCursor &&
        prevCursor == other.prevCursor;
  }
}
