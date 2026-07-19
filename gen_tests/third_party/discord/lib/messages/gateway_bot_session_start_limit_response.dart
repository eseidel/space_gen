import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GatewayBotSessionStartLimitResponse {
  const GatewayBotSessionStartLimitResponse({
    required this.maxConcurrency,
    required this.remaining,
    required this.resetAfter,
    required this.total,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GatewayBotSessionStartLimitResponse].
  factory GatewayBotSessionStartLimitResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GatewayBotSessionStartLimitResponse',
      json,
      () => GatewayBotSessionStartLimitResponse(
        maxConcurrency: json['max_concurrency'] as int,
        remaining: json['remaining'] as int,
        resetAfter: json['reset_after'] as int,
        total: json['total'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GatewayBotSessionStartLimitResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GatewayBotSessionStartLimitResponse.fromJson(json);
  }

  final int maxConcurrency;
  final int remaining;
  final int resetAfter;
  final int total;

  /// Converts a [GatewayBotSessionStartLimitResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'max_concurrency': maxConcurrency,
      'remaining': remaining,
      'reset_after': resetAfter,
      'total': total,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([maxConcurrency, remaining, resetAfter, total]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GatewayBotSessionStartLimitResponse &&
        maxConcurrency == other.maxConcurrency &&
        remaining == other.remaining &&
        resetAfter == other.resetAfter &&
        total == other.total;
  }
}
