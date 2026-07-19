import 'package:github/model_helpers.dart';
import 'package:github/models/rate_limit.dart';
import 'package:github/models/rate_limit_overview_resources.dart';
import 'package:meta/meta.dart';

/// {@template rate_limit_overview}
/// Rate Limit Overview
/// Rate Limit Overview
/// {@endtemplate}
@immutable
class RateLimitOverview {
  /// {@macro rate_limit_overview}
  const RateLimitOverview({required this.resources, required this.rate});

  /// Converts a `Map<String, dynamic>` to a [RateLimitOverview].
  factory RateLimitOverview.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RateLimitOverview',
      json,
      () => RateLimitOverview(
        resources: RateLimitOverviewResources.fromJson(
          json['resources'] as Map<String, dynamic>,
        ),
        rate: RateLimit.fromJson(json['rate'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RateLimitOverview? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RateLimitOverview.fromJson(json);
  }

  final RateLimitOverviewResources resources;

  /// Rate Limit
  final RateLimit rate;

  /// Converts a [RateLimitOverview] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'resources': resources.toJson(), 'rate': rate.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([resources, rate]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RateLimitOverview &&
        resources == other.resources &&
        rate == other.rate;
  }
}
