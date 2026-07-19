import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/scrap_transaction.dart';

@immutable
class GetScrapShip200ResponseData {
  const GetScrapShip200ResponseData({required this.transaction});

  /// Converts a `Map<String, dynamic>` to a [GetScrapShip200ResponseData].
  factory GetScrapShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetScrapShip200ResponseData',
      json,
      () => GetScrapShip200ResponseData(
        transaction: ScrapTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetScrapShip200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetScrapShip200ResponseData.fromJson(json);
  }

  /// Result of a scrap transaction.
  final ScrapTransaction transaction;

  /// Converts a [GetScrapShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'transaction': transaction.toJson()};
  }

  @override
  int get hashCode => transaction.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetScrapShip200ResponseData &&
        transaction == other.transaction;
  }
}
