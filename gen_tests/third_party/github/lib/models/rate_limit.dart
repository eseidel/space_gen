import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template rate_limit}
/// Rate Limit
/// {@endtemplate}
@immutable
class RateLimit {
  /// {@macro rate_limit}
  const RateLimit({
    required this.limit,
    required this.remaining,
    required this.reset,
    required this.used,
  });

  /// Converts a `Map<String, dynamic>` to a [RateLimit].
  factory RateLimit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RateLimit',
      json,
      () => RateLimit(
        limit: json['limit'] as int,
        remaining: json['remaining'] as int,
        reset: json['reset'] as int,
        used: json['used'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RateLimit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RateLimit.fromJson(json);
  }

  final int limit;
  final int remaining;
  final int reset;
  final int used;

  /// Converts a [RateLimit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'remaining': remaining,
      'reset': reset,
      'used': used,
    };
  }

  @override
  int get hashCode => Object.hashAll([limit, remaining, reset, used]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RateLimit &&
        limit == other.limit &&
        remaining == other.remaining &&
        reset == other.reset &&
        used == other.used;
  }
}
