import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_cache_usage_by_repository}
/// Actions Cache Usage by repository
/// GitHub Actions Cache Usage by repository.
/// {@endtemplate}
@immutable
class ActionsCacheUsageByRepository {
  /// {@macro actions_cache_usage_by_repository}
  const ActionsCacheUsageByRepository({
    required this.fullName,
    required this.activeCachesSizeInBytes,
    required this.activeCachesCount,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsCacheUsageByRepository].
  factory ActionsCacheUsageByRepository.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsCacheUsageByRepository',
      json,
      () => ActionsCacheUsageByRepository(
        fullName: json['full_name'] as String,
        activeCachesSizeInBytes: json['active_caches_size_in_bytes'] as int,
        activeCachesCount: json['active_caches_count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCacheUsageByRepository? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCacheUsageByRepository.fromJson(json);
  }

  /// The repository owner and name for the cache usage being shown.
  /// Example: `'octo-org/Hello-World'`
  final String fullName;

  /// The sum of the size in bytes of all the active cache items in the
  /// repository.
  /// Example: `2322142`
  final int activeCachesSizeInBytes;

  /// The number of active caches in the repository.
  /// Example: `3`
  final int activeCachesCount;

  /// Converts an [ActionsCacheUsageByRepository] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'active_caches_size_in_bytes': activeCachesSizeInBytes,
      'active_caches_count': activeCachesCount,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([fullName, activeCachesSizeInBytes, activeCachesCount]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCacheUsageByRepository &&
        fullName == other.fullName &&
        activeCachesSizeInBytes == other.activeCachesSizeInBytes &&
        activeCachesCount == other.activeCachesCount;
  }
}
