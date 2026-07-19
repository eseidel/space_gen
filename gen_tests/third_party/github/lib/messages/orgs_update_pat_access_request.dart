import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_update_pat_access_request_action.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdatePatAccessRequest {
  const OrgsUpdatePatAccessRequest({required this.action});

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdatePatAccessRequest].
  factory OrgsUpdatePatAccessRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdatePatAccessRequest',
      json,
      () => OrgsUpdatePatAccessRequest(
        action: OrgsUpdatePatAccessRequestAction.fromJson(
          json['action'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdatePatAccessRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdatePatAccessRequest.fromJson(json);
  }

  /// Action to apply to the fine-grained personal access token.
  final OrgsUpdatePatAccessRequestAction action;

  /// Converts an [OrgsUpdatePatAccessRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'action': action.toJson()};
  }

  @override
  int get hashCode => action.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdatePatAccessRequest && action == other.action;
  }
}
