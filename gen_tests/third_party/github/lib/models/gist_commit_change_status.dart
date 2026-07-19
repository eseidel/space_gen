import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistCommitChangeStatus {
  const GistCommitChangeStatus({this.total, this.additions, this.deletions});

  /// Converts a `Map<String, dynamic>` to a [GistCommitChangeStatus].
  factory GistCommitChangeStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistCommitChangeStatus',
      json,
      () => GistCommitChangeStatus(
        total: json['total'] as int?,
        additions: json['additions'] as int?,
        deletions: json['deletions'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistCommitChangeStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistCommitChangeStatus.fromJson(json);
  }

  final int? total;
  final int? additions;
  final int? deletions;

  /// Converts a [GistCommitChangeStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total': total, 'additions': additions, 'deletions': deletions};
  }

  @override
  int get hashCode => Object.hashAll([total, additions, deletions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistCommitChangeStatus &&
        total == other.total &&
        additions == other.additions &&
        deletions == other.deletions;
  }
}
