// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_configuration.dart';
import 'package:github/models/code_security_set_configuration_as_default_for_enterprise200_response_default_for_new_repos.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecuritySetConfigurationAsDefaultForEnterprise200Response {
  const CodeSecuritySetConfigurationAsDefaultForEnterprise200Response({
    this.defaultForNewRepos,
    this.configuration,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecuritySetConfigurationAsDefaultForEnterprise200Response].
  factory CodeSecuritySetConfigurationAsDefaultForEnterprise200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecuritySetConfigurationAsDefaultForEnterprise200Response',
      json,
      () => CodeSecuritySetConfigurationAsDefaultForEnterprise200Response(
        defaultForNewRepos:
            CodeSecuritySetConfigurationAsDefaultForEnterprise200ResponseDefaultForNewRepos.maybeFromJson(
              json['default_for_new_repos'] as String?,
            ),
        configuration: CodeSecurityConfiguration.maybeFromJson(
          json['configuration'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecuritySetConfigurationAsDefaultForEnterprise200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecuritySetConfigurationAsDefaultForEnterprise200Response.fromJson(
      json,
    );
  }

  /// Specifies which types of repository this security configuration is
  /// applied to by default.
  final CodeSecuritySetConfigurationAsDefaultForEnterprise200ResponseDefaultForNewRepos?
  defaultForNewRepos;

  /// A code security configuration
  final CodeSecurityConfiguration? configuration;

  /// Converts a [CodeSecuritySetConfigurationAsDefaultForEnterprise200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (defaultForNewRepos != null)
        'default_for_new_repos': defaultForNewRepos?.toJson(),
      if (configuration != null) 'configuration': configuration?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([defaultForNewRepos, configuration]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodeSecuritySetConfigurationAsDefaultForEnterprise200Response &&
        defaultForNewRepos == other.defaultForNewRepos &&
        configuration == other.configuration;
  }
}
