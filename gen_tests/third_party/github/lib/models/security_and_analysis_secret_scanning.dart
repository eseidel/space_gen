import 'package:github/model_helpers.dart';
import 'package:github/models/security_and_analysis_secret_scanning_status.dart';
import 'package:meta/meta.dart';

@immutable
class SecurityAndAnalysisSecretScanning {
  const SecurityAndAnalysisSecretScanning({this.status});

  /// Converts a `Map<String, dynamic>` to a
  /// [SecurityAndAnalysisSecretScanning].
  factory SecurityAndAnalysisSecretScanning.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecurityAndAnalysisSecretScanning',
      json,
      () => SecurityAndAnalysisSecretScanning(
        status: SecurityAndAnalysisSecretScanningStatus.maybeFromJson(
          json['status'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisSecretScanning? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisSecretScanning.fromJson(json);
  }

  final SecurityAndAnalysisSecretScanningStatus? status;

  /// Converts a [SecurityAndAnalysisSecretScanning]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status?.toJson()};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAndAnalysisSecretScanning && status == other.status;
  }
}
