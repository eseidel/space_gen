import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_update_pat_accesses_request_action.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdatePatAccessesRequest {
  const OrgsUpdatePatAccessesRequest({
    required this.action,
    required this.patIds,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdatePatAccessesRequest].
  factory OrgsUpdatePatAccessesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdatePatAccessesRequest',
      json,
      () => OrgsUpdatePatAccessesRequest(
        action: OrgsUpdatePatAccessesRequestAction.fromJson(
          json['action'] as String,
        ),
        patIds: (json['pat_ids'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessesRequest.fromJson(json);
  }

  /// Action to apply to the fine-grained personal access token.
  final OrgsUpdatePatAccessesRequestAction action;

  /// The IDs of the fine-grained personal access tokens.
  final List<int> patIds;

  /// Converts an [OrgsUpdatePatAccessesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'action': action.toJson(), 'pat_ids': patIds};
  }

  @override
  int get hashCode => Object.hashAll([action, listHash(patIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdatePatAccessesRequest &&
        action == other.action &&
        listsEqual(patIds, other.patIds);
  }
}
