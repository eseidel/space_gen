import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class DeliverContractRequest {
  DeliverContractRequest({
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.units,
  }) {
    units.validate(min: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [DeliverContractRequest].
  factory DeliverContractRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeliverContractRequest',
      json,
      () => DeliverContractRequest(
        shipSymbol: json['shipSymbol'] as String,
        tradeSymbol: json['tradeSymbol'] as String,
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeliverContractRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeliverContractRequest.fromJson(json);
  }

  /// Symbol of a ship located in the destination to deliver a contract and
  /// that has a good to deliver in its cargo.
  final String shipSymbol;

  /// The symbol of the good to deliver.
  /// Example: `'IRON_ORE'`
  final String tradeSymbol;

  /// Amount of units to deliver.
  /// Example: `10`
  final int units;

  /// Converts a [DeliverContractRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }

  @override
  int get hashCode => Object.hashAll([shipSymbol, tradeSymbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeliverContractRequest &&
        shipSymbol == other.shipSymbol &&
        tradeSymbol == other.tradeSymbol &&
        units == other.units;
  }
}
