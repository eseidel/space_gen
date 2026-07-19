import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CommitStats {
  const CommitStats({this.additions, this.deletions, this.total});

  /// Converts a `Map<String, dynamic>` to a [CommitStats].
  factory CommitStats.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitStats',
      json,
      () => CommitStats(
        additions: json['additions'] as int?,
        deletions: json['deletions'] as int?,
        total: json['total'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitStats? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitStats.fromJson(json);
  }

  final int? additions;
  final int? deletions;
  final int? total;

  /// Converts a [CommitStats] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (additions != null) 'additions': additions,
      if (deletions != null) 'deletions': deletions,
      if (total != null) 'total': total,
    };
  }

  @override
  int get hashCode => Object.hashAll([additions, deletions, total]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitStats &&
        additions == other.additions &&
        deletions == other.deletions &&
        total == other.total;
  }
}
