import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_attach_enterprise_configuration_request_scope.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityAttachEnterpriseConfigurationRequest {
  const CodeSecurityAttachEnterpriseConfigurationRequest({required this.scope});

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityAttachEnterpriseConfigurationRequest].
  factory CodeSecurityAttachEnterpriseConfigurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityAttachEnterpriseConfigurationRequest',
      json,
      () => CodeSecurityAttachEnterpriseConfigurationRequest(
        scope: CodeSecurityAttachEnterpriseConfigurationRequestScope.fromJson(
          json['scope'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityAttachEnterpriseConfigurationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityAttachEnterpriseConfigurationRequest.fromJson(json);
  }

  /// The type of repositories to attach the configuration to.
  final CodeSecurityAttachEnterpriseConfigurationRequestScope scope;

  /// Converts a [CodeSecurityAttachEnterpriseConfigurationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'scope': scope.toJson()};
  }

  @override
  int get hashCode => scope.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityAttachEnterpriseConfigurationRequest &&
        scope == other.scope;
  }
}
