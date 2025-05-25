import 'package:meta/meta.dart';
import 'package:spacetraders/model/faction_symbol.dart';

@immutable
class SystemFaction {
  const SystemFaction({required this.symbol});

  factory SystemFaction.fromJson(Map<String, dynamic> json) {
    return SystemFaction(
      symbol: FactionSymbol.fromJson(json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SystemFaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SystemFaction.fromJson(json);
  }

  final FactionSymbol symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SystemFaction && symbol == other.symbol;
  }
}
