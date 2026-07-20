import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template public_agent}
/// Public agent details.
/// {@endtemplate}
@immutable
class PublicAgent {
  /// {@macro public_agent}
  PublicAgent({
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  }) {
    symbol.validate(minLength: 3, maxLength: 14);
    headquarters.validate(minLength: 1);
    startingFaction.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [PublicAgent].
  factory PublicAgent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PublicAgent',
      json,
      () => PublicAgent(
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
  static PublicAgent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PublicAgent.fromJson(json);
  }

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

  /// Converts a [PublicAgent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'headquarters': headquarters,
      'credits': credits,
      'startingFaction': startingFaction,
      'shipCount': shipCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    headquarters,
    credits,
    startingFaction,
    shipCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PublicAgent &&
        symbol == other.symbol &&
        headquarters == other.headquarters &&
        credits == other.credits &&
        startingFaction == other.startingFaction &&
        shipCount == other.shipCount;
  }
}
