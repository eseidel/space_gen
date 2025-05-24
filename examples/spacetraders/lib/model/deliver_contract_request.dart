class DeliverContractRequest {
  DeliverContractRequest({
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.units,
  });

  factory DeliverContractRequest.fromJson(Map<String, dynamic> json) {
    return DeliverContractRequest(
      shipSymbol: json['shipSymbol'] as String,
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
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

  final String shipSymbol;
  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}
