import 'package:github/model_helpers.dart';
import 'package:github/models/merged_upstream_merge_type.dart';
import 'package:meta/meta.dart';

/// {@template merged_upstream}
/// Merged upstream
/// Results of a successful merge upstream request
/// {@endtemplate}
@immutable
class MergedUpstream {
  /// {@macro merged_upstream}
  const MergedUpstream({this.message, this.mergeType, this.baseBranch});

  /// Converts a `Map<String, dynamic>` to a [MergedUpstream].
  factory MergedUpstream.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MergedUpstream',
      json,
      () => MergedUpstream(
        message: json['message'] as String?,
        mergeType: MergedUpstreamMergeType.maybeFromJson(
          json['merge_type'] as String?,
        ),
        baseBranch: json['base_branch'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MergedUpstream? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MergedUpstream.fromJson(json);
  }

  final String? message;
  final MergedUpstreamMergeType? mergeType;
  final String? baseBranch;

  /// Converts a [MergedUpstream] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'merge_type': mergeType?.toJson(),
      'base_branch': baseBranch,
    };
  }

  @override
  int get hashCode => Object.hashAll([message, mergeType, baseBranch]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MergedUpstream &&
        message == other.message &&
        mergeType == other.mergeType &&
        baseBranch == other.baseBranch;
  }
}
