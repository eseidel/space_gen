
class ExtractionYield {
  ExtractionYield({
    required this.symbol,
    required this.units,
  });

  factory ExtractionYield.fromJson(Map<String, dynamic> json) {
    return ExtractionYield(
      symbol: json['symbol'] as String,
      units: json['units'] as int,
    );
  }

  final String symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'units': units,
    };
  }
}
