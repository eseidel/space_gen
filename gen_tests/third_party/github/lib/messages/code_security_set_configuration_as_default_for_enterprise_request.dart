// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_set_configuration_as_default_for_enterprise_request_default_for_new_repos.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest {
  const CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest({
    this.defaultForNewRepos,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest].
  factory CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest',
      json,
      () => CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest(
        defaultForNewRepos:
            CodeSecuritySetConfigurationAsDefaultForEnterpriseRequestDefaultForNewRepos.maybeFromJson(
              json['default_for_new_repos'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest.fromJson(
      json,
    );
  }

  /// Specify which types of repository this security configuration should be
  /// applied to by default.
  final CodeSecuritySetConfigurationAsDefaultForEnterpriseRequestDefaultForNewRepos?
  defaultForNewRepos;

  /// Converts a [CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'default_for_new_repos': defaultForNewRepos?.toJson()};
  }

  @override
  int get hashCode => defaultForNewRepos.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest &&
        defaultForNewRepos == other.defaultForNewRepos;
  }
}
