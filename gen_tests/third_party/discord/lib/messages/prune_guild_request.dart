import 'package:discord/model_helpers.dart';
import 'package:discord/models/prune_guild_request_include_roles.dart';
import 'package:meta/meta.dart';

@immutable
class PruneGuildRequest {
  const PruneGuildRequest({
    this.days,
    this.computePruneCount,
    this.includeRoles,
  });

  /// Converts a `Map<String, dynamic>` to a [PruneGuildRequest].
  factory PruneGuildRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PruneGuildRequest',
      json,
      () => PruneGuildRequest(
        days: json['days'] as int?,
        computePruneCount: json['compute_prune_count'] as bool?,
        includeRoles: PruneGuildRequestIncludeRoles.maybeFromJson(
          json['include_roles'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PruneGuildRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PruneGuildRequest.fromJson(json);
  }

  final int? days;
  final bool? computePruneCount;
  final PruneGuildRequestIncludeRoles? includeRoles;

  /// Converts a [PruneGuildRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'days': days,
      'compute_prune_count': computePruneCount,
      'include_roles': includeRoles?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([days, computePruneCount, includeRoles]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PruneGuildRequest &&
        days == other.days &&
        computePruneCount == other.computePruneCount &&
        includeRoles == other.includeRoles;
  }
}
