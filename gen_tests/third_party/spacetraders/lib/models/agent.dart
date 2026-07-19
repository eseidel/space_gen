import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template agent}
/// Agent details.
/// {@endtemplate}
@immutable
class Agent {
  /// {@macro agent}
  const Agent({
    required this.accountId,
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  });

  /// Converts a `Map<String, dynamic>` to an [Agent].
  factory Agent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Agent',
      json,
      () => Agent(
        accountId: json['accountId'] as String,
        symbol: json['symbol'] as String,
        headquarters: json['headquarters'] as String,
        credits: json['credits'] as int,
        startingFaction: json['startingFaction'] as String,
        shipCount: json['shipCount'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Agent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Agent.fromJson(json);
  }

  /// Account ID that is tied to this agent. Only included on your own agent.
  final String accountId;

  /// Symbol of the agent.
  final String symbol;

  /// The headquarters of the agent.
  final String headquarters;

  /// The number of credits the agent has available. Credits can be negative
  /// if funds have been overdrawn.
  final int credits;

  /// The faction the agent started with.
  final String startingFaction;

  /// How many ships are owned by the agent.
  final int shipCount;

  /// Converts an [Agent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'symbol': symbol,
      'headquarters': headquarters,
      'credits': credits,
      'startingFaction': startingFaction,
      'shipCount': shipCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    accountId,
    symbol,
    headquarters,
    credits,
    startingFaction,
    shipCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Agent &&
        accountId == other.accountId &&
        symbol == other.symbol &&
        headquarters == other.headquarters &&
        credits == other.credits &&
        startingFaction == other.startingFaction &&
        shipCount == other.shipCount;
  }
}
