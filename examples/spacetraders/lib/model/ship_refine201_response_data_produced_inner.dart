class ShipRefine201ResponseDataProducedInner {
  ShipRefine201ResponseDataProducedInner({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedInner(
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
    );
  }

  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}
