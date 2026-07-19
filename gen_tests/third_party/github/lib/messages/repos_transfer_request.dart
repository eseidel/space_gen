import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposTransferRequest {
  const ReposTransferRequest({
    required this.newOwner,
    this.newName,
    this.teamIds,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposTransferRequest].
  factory ReposTransferRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposTransferRequest',
      json,
      () => ReposTransferRequest(
        newOwner: json['new_owner'] as String,
        newName: json['new_name'] as String?,
        teamIds: (json['team_ids'] as List?)?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposTransferRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposTransferRequest.fromJson(json);
  }

  /// The username or organization name the repository will be transferred to.
  final String newOwner;

  /// The new name to be given to the repository.
  final String? newName;

  /// ID of the team or teams to add to the repository. Teams can only be
  /// added to organization-owned repositories.
  final List<int>? teamIds;

  /// Converts a [ReposTransferRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'new_owner': newOwner,
      if (newName != null) 'new_name': newName,
      if (teamIds != null) 'team_ids': teamIds,
    };
  }

  @override
  int get hashCode => Object.hashAll([newOwner, newName, listHash(teamIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposTransferRequest &&
        newOwner == other.newOwner &&
        newName == other.newName &&
        listsEqual(teamIds, other.teamIds);
  }
}
