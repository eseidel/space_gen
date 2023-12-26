class JumpGate {
  JumpGate({
    required this.symbol,
    required this.connections,
  });

  factory JumpGate.fromJson(Map<String, dynamic> json) {
    return JumpGate(
      symbol: json['symbol'] as String,
      connections: (json['connections'] as List<dynamic>).cast<String>(),
    );
  }

  final String symbol;
  final List<String> connections;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'connections': connections,
    };
  }
}
