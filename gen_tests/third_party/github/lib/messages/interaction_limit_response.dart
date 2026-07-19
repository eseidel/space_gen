import 'package:github/model_helpers.dart';
import 'package:github/models/interaction_group.dart';
import 'package:meta/meta.dart';

/// {@template interaction_limit_response}
/// Interaction Limits
/// Interaction limit settings.
/// {@endtemplate}
@immutable
class InteractionLimitResponse {
  /// {@macro interaction_limit_response}
  const InteractionLimitResponse({
    required this.limit,
    required this.origin,
    required this.expiresAt,
  });

  /// Converts a `Map<String, dynamic>` to an [InteractionLimitResponse].
  factory InteractionLimitResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InteractionLimitResponse',
      json,
      () => InteractionLimitResponse(
        limit: InteractionGroup.fromJson(json['limit'] as String),
        origin: json['origin'] as String,
        expiresAt: DateTime.parse(json['expires_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionLimitResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionLimitResponse.fromJson(json);
  }

  /// The type of GitHub user that can comment, open issues, or create pull
  /// requests while the interaction limit is in effect.
  /// Example: `'collaborators_only'`
  final InteractionGroup limit;

  /// Example: `'repository'`
  final String origin;

  /// Example: `'2018-08-17T04:18:39Z'`
  final DateTime expiresAt;

  /// Converts an [InteractionLimitResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'limit': limit.toJson(),
      'origin': origin,
      'expires_at': expiresAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([limit, origin, expiresAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InteractionLimitResponse &&
        limit == other.limit &&
        origin == other.origin &&
        expiresAt == other.expiresAt;
  }
}
