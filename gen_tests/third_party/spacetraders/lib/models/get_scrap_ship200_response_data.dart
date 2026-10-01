// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
