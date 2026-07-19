import 'package:github/model_helpers.dart';
import 'package:github/models/actions_cache_list_actions_caches_inner.dart';
import 'package:meta/meta.dart';

/// {@template actions_cache_list}
/// Repository actions caches
/// Repository actions caches
/// {@endtemplate}
@immutable
class ActionsCacheList {
  /// {@macro actions_cache_list}
  const ActionsCacheList({
    required this.totalCount,
    required this.actionsCaches,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsCacheList].
  factory ActionsCacheList.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsCacheList',
      json,
      () => ActionsCacheList(
        totalCount: json['total_count'] as int,
        actionsCaches: (json['actions_caches'] as List)
            .map<ActionsCacheListActionsCachesInner>(
              (e) => ActionsCacheListActionsCachesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCacheList? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsCacheList.fromJson(json);
  }

  /// Total number of caches
  /// Example: `2`
  final int totalCount;

  /// Array of caches
  final List<ActionsCacheListActionsCachesInner> actionsCaches;

  /// Converts an [ActionsCacheList] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'actions_caches': actionsCaches.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(actionsCaches)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCacheList &&
        totalCount == other.totalCount &&
        listsEqual(actionsCaches, other.actionsCaches);
  }
}
