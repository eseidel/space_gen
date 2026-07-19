import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposRenameBranchRequest {
  const ReposRenameBranchRequest({required this.newName});

  /// Converts a `Map<String, dynamic>` to a [ReposRenameBranchRequest].
  factory ReposRenameBranchRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposRenameBranchRequest',
      json,
      () => ReposRenameBranchRequest(newName: json['new_name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRenameBranchRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposRenameBranchRequest.fromJson(json);
  }

  /// The new name of the branch.
  final String newName;

  /// Converts a [ReposRenameBranchRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'new_name': newName};
  }

  @override
  int get hashCode => newName.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposRenameBranchRequest && newName == other.newName;
  }
}
