import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseHealth {
  const GetStatus200ResponseHealth({this.lastMarketUpdate});

  /// Converts a `Map<String, dynamic>` to a [GetStatus200ResponseHealth].
  factory GetStatus200ResponseHealth.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStatus200ResponseHealth',
      json,
      () => GetStatus200ResponseHealth(
        lastMarketUpdate: json['lastMarketUpdate'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseHealth? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseHealth.fromJson(json);
  }

  /// The date/time when the market was last updated.
  final String? lastMarketUpdate;

  /// Converts a [GetStatus200ResponseHealth] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'lastMarketUpdate': lastMarketUpdate};
  }

  @override
  int get hashCode => lastMarketUpdate.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseHealth &&
        lastMarketUpdate == other.lastMarketUpdate;
  }
}
