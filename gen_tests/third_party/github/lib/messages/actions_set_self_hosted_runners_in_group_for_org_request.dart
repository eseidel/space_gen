import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetSelfHostedRunnersInGroupForOrgRequest {
  const ActionsSetSelfHostedRunnersInGroupForOrgRequest({
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetSelfHostedRunnersInGroupForOrgRequest].
  factory ActionsSetSelfHostedRunnersInGroupForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetSelfHostedRunnersInGroupForOrgRequest',
      json,
      () => ActionsSetSelfHostedRunnersInGroupForOrgRequest(
        runners: (json['runners'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetSelfHostedRunnersInGroupForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetSelfHostedRunnersInGroupForOrgRequest.fromJson(json);
  }

  /// List of runner IDs to add to the runner group.
  final List<int> runners;

  /// Converts an [ActionsSetSelfHostedRunnersInGroupForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'runners': runners};
  }

  @override
  int get hashCode => listHash(runners).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetSelfHostedRunnersInGroupForOrgRequest &&
        listsEqual(runners, other.runners);
  }
}
