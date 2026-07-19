import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template cooldown}
/// A cooldown is a period of time in which a ship cannot perform certain
/// actions.
/// {@endtemplate}
@immutable
class Cooldown {
  /// {@macro cooldown}
  const Cooldown({
    required this.shipSymbol,
    required this.totalSeconds,
    required this.remainingSeconds,
    this.expiration,
  });

  /// Converts a `Map<String, dynamic>` to a [Cooldown].
  factory Cooldown.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Cooldown',
      json,
      () => Cooldown(
        shipSymbol: json['shipSymbol'] as String,
        totalSeconds: json['totalSeconds'] as int,
        remainingSeconds: json['remainingSeconds'] as int,
        expiration: maybeParseDateTime(json['expiration'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Cooldown? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Cooldown.fromJson(json);
  }

  /// The symbol of the ship that is on cooldown
  final String shipSymbol;

  /// The total duration of the cooldown in seconds
  final int totalSeconds;

  /// The remaining duration of the cooldown in seconds
  final int remainingSeconds;

  /// The date and time when the cooldown expires in ISO 8601 format
  final DateTime? expiration;

  /// Converts a [Cooldown] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'totalSeconds': totalSeconds,
      'remainingSeconds': remainingSeconds,
      if (expiration != null) 'expiration': expiration?.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([shipSymbol, totalSeconds, remainingSeconds, expiration]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cooldown &&
        shipSymbol == other.shipSymbol &&
        totalSeconds == other.totalSeconds &&
        remainingSeconds == other.remainingSeconds &&
        expiration == other.expiration;
  }
}
