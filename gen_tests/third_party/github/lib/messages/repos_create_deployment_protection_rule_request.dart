import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateDeploymentProtectionRuleRequest {
  const ReposCreateDeploymentProtectionRuleRequest({this.integrationId});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateDeploymentProtectionRuleRequest].
  factory ReposCreateDeploymentProtectionRuleRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateDeploymentProtectionRuleRequest',
      json,
      () => ReposCreateDeploymentProtectionRuleRequest(
        integrationId: json['integration_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDeploymentProtectionRuleRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeploymentProtectionRuleRequest.fromJson(json);
  }

  /// The ID of the custom app that will be enabled on the environment.
  final int? integrationId;

  /// Converts a [ReposCreateDeploymentProtectionRuleRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'integration_id': integrationId};
  }

  @override
  int get hashCode => integrationId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentProtectionRuleRequest &&
        integrationId == other.integrationId;
  }
}
