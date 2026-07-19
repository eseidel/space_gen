import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template jump_gate}
/// Details of a jump gate waypoint.
/// {@endtemplate}
@immutable
class JumpGate {
  /// {@macro jump_gate}
  const JumpGate({required this.symbol, required this.connections});

  /// Converts a `Map<String, dynamic>` to a [JumpGate].
  factory JumpGate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JumpGate',
      json,
      () => JumpGate(
        symbol: WaypointSymbol.fromJson(json['symbol'] as String),
        connections: (json['connections'] as List).cast<String>(),
      ),
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

  /// The symbol of the waypoint.
  final WaypointSymbol symbol;

  /// All the gates that are connected to this waypoint.
  final List<String> connections;

  /// Converts a [JumpGate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'connections': connections};
  }

  @override
  int get hashCode => Object.hashAll([symbol, listHash(connections)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JumpGate &&
        symbol == other.symbol &&
        listsEqual(connections, other.connections);
  }
}
