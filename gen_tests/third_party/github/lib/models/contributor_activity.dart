import 'package:github/model_helpers.dart';
import 'package:github/models/contributor_activity_weeks_inner.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template contributor_activity}
/// Contributor Activity
/// Contributor Activity
/// {@endtemplate}
@immutable
class ContributorActivity {
  /// {@macro contributor_activity}
  const ContributorActivity({
    required this.author,
    required this.total,
    required this.weeks,
  });

  /// Converts a `Map<String, dynamic>` to a [ContributorActivity].
  factory ContributorActivity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContributorActivity',
      json,
      () => ContributorActivity(
        author: SimpleUser.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        total: json['total'] as int,
        weeks: (json['weeks'] as List)
            .map<ContributorActivityWeeksInner>(
              (e) => ContributorActivityWeeksInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContributorActivity? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContributorActivity.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? author;

  /// Example: `135`
  final int total;

  /// Example:
  /// ```json
  /// {
  ///   "w": "1367712000",
  ///   "a": 6898,
  ///   "d": 77,
  ///   "c": 10
  /// }
  /// ```
  final List<ContributorActivityWeeksInner> weeks;

  /// Converts a [ContributorActivity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'author': author?.toJson(),
      'total': total,
      'weeks': weeks.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([author, total, listHash(weeks)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContributorActivity &&
        author == other.author &&
        total == other.total &&
        listsEqual(weeks, other.weeks);
  }
}
