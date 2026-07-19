import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCacheUsageOrgEnterprise {
  const ActionsCacheUsageOrgEnterprise({
    required this.totalActiveCachesCount,
    required this.totalActiveCachesSizeInBytes,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsCacheUsageOrgEnterprise].
  factory ActionsCacheUsageOrgEnterprise.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsCacheUsageOrgEnterprise',
      json,
      () => ActionsCacheUsageOrgEnterprise(
        totalActiveCachesCount: json['total_active_caches_count'] as int,
        totalActiveCachesSizeInBytes:
            json['total_active_caches_size_in_bytes'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCacheUsageOrgEnterprise? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCacheUsageOrgEnterprise.fromJson(json);
  }

  /// The count of active caches across all repositories of an enterprise or
  /// an organization.
  final int totalActiveCachesCount;

  /// The total size in bytes of all active cache items across all
  /// repositories of an enterprise or an organization.
  final int totalActiveCachesSizeInBytes;

  /// Converts an [ActionsCacheUsageOrgEnterprise] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_active_caches_count': totalActiveCachesCount,
      'total_active_caches_size_in_bytes': totalActiveCachesSizeInBytes,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalActiveCachesCount, totalActiveCachesSizeInBytes]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCacheUsageOrgEnterprise &&
        totalActiveCachesCount == other.totalActiveCachesCount &&
        totalActiveCachesSizeInBytes == other.totalActiveCachesSizeInBytes;
  }
}
