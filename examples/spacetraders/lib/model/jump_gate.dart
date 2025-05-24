class JumpGate {
  JumpGate({required this.symbol, required this.connections});

  factory JumpGate.fromJson(Map<String, dynamic> json) {
    return JumpGate(
      symbol: json['symbol'] as String,
      connections: (json['connections'] as List<dynamic>).cast<String>(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JumpGate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JumpGate.fromJson(json);
  }

  final String symbol;
  final List<String> connections;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'connections': connections};
  }
}
