import 'package:github/model_helpers.dart';
import 'package:github/models/interaction_expiry.dart';
import 'package:github/models/interaction_group.dart';
import 'package:meta/meta.dart';

/// {@template interaction_limit}
/// Interaction Restrictions
/// Limit interactions to a specific type of user for a specified duration
/// {@endtemplate}
@immutable
class InteractionLimit {
  /// {@macro interaction_limit}
  const InteractionLimit({required this.limit, this.expiry});

  /// Converts a `Map<String, dynamic>` to an [InteractionLimit].
  factory InteractionLimit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InteractionLimit',
      json,
      () => InteractionLimit(
        limit: InteractionGroup.fromJson(json['limit'] as String),
        expiry: InteractionExpiry.maybeFromJson(json['expiry'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionLimit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionLimit.fromJson(json);
  }

  /// The type of GitHub user that can comment, open issues, or create pull
  /// requests while the interaction limit is in effect.
  /// Example: `'collaborators_only'`
  final InteractionGroup limit;

  /// The duration of the interaction restriction. Default: `one_day`.
  /// Example: `'one_month'`
  final InteractionExpiry? expiry;

  /// Converts an [InteractionLimit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'limit': limit.toJson(),
      if (expiry != null) 'expiry': expiry?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([limit, expiry]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InteractionLimit &&
        limit == other.limit &&
        expiry == other.expiry;
  }
}
