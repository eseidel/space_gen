import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_cargo.dart';

@immutable
class TransferCargo200ResponseData {
  const TransferCargo200ResponseData({
    required this.cargo,
    required this.targetCargo,
  });

  /// Converts a `Map<String, dynamic>` to a [TransferCargo200ResponseData].
  factory TransferCargo200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TransferCargo200ResponseData',
      json,
      () => TransferCargo200ResponseData(
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        targetCargo: ShipCargo.fromJson(
          json['targetCargo'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TransferCargo200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TransferCargo200ResponseData.fromJson(json);
  }

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Ship cargo details.
  final ShipCargo targetCargo;

  /// Converts a [TransferCargo200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'cargo': cargo.toJson(), 'targetCargo': targetCargo.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([cargo, targetCargo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransferCargo200ResponseData &&
        cargo == other.cargo &&
        targetCargo == other.targetCargo;
  }
}
