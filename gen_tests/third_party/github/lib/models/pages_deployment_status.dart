import 'package:github/model_helpers.dart';
import 'package:github/models/pages_deployment_status_status.dart';
import 'package:meta/meta.dart';

/// {@template pages_deployment_status}
/// GitHub Pages deployment status
/// {@endtemplate}
@immutable
class PagesDeploymentStatus {
  /// {@macro pages_deployment_status}
  const PagesDeploymentStatus({this.status});

  /// Converts a `Map<String, dynamic>` to a [PagesDeploymentStatus].
  factory PagesDeploymentStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PagesDeploymentStatus',
      json,
      () => PagesDeploymentStatus(
        status: PagesDeploymentStatusStatus.maybeFromJson(
          json['status'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesDeploymentStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PagesDeploymentStatus.fromJson(json);
  }

  /// The current status of the deployment.
  final PagesDeploymentStatusStatus? status;

  /// Converts a [PagesDeploymentStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (status != null) 'status': status?.toJson()};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesDeploymentStatus && status == other.status;
  }
}
