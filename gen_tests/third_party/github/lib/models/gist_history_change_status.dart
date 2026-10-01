// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GistHistoryChangeStatus {
  const GistHistoryChangeStatus({this.total, this.additions, this.deletions});

  /// Converts a `Map<String, dynamic>` to a [GistHistoryChangeStatus].
  factory GistHistoryChangeStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistHistoryChangeStatus',
      json,
      () => GistHistoryChangeStatus(
        total: json['total'] as int?,
        additions: json['additions'] as int?,
        deletions: json['deletions'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistHistoryChangeStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistHistoryChangeStatus.fromJson(json);
  }

  final int? total;
  final int? additions;
  final int? deletions;

  /// Converts a [GistHistoryChangeStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total': ?total, 'additions': ?additions, 'deletions': ?deletions};
  }

  @override
  int get hashCode => Object.hashAll([total, additions, deletions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistHistoryChangeStatus &&
        total == other.total &&
        additions == other.additions &&
        deletions == other.deletions;
  }
}
