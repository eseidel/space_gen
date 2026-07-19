import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/repair_transaction.dart';

@immutable
class GetRepairShip200ResponseData {
  const GetRepairShip200ResponseData({required this.transaction});

  /// Converts a `Map<String, dynamic>` to a [GetRepairShip200ResponseData].
  factory GetRepairShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetRepairShip200ResponseData',
      json,
      () => GetRepairShip200ResponseData(
        transaction: RepairTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetRepairShip200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetRepairShip200ResponseData.fromJson(json);
  }

  /// Result of a repair transaction.
  final RepairTransaction transaction;

  /// Converts a [GetRepairShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'transaction': transaction.toJson()};
  }

  @override
  int get hashCode => transaction.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetRepairShip200ResponseData &&
        transaction == other.transaction;
  }
}
