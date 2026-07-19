// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_security_update_enterprise_configuration_request_dependency_graph_autosubmit_action_options}
/// Feature options for Automatic dependency submission
/// {@endtemplate}
@immutable
class CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions {
  /// {@macro code_security_update_enterprise_configuration_request_dependency_graph_autosubmit_action_options}
  const CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions({
    this.labeledRunners,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions].
  factory CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions',
      json,
      () =>
          CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions(
            labeledRunners: json['labeled_runners'] as bool?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions.fromJson(
      json,
    );
  }

  /// Whether to use runners labeled with 'dependency-submission' or standard
  /// GitHub runners.
  final bool? labeledRunners;

  /// Converts a [CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'labeled_runners': ?labeledRunners};
  }

  @override
  int get hashCode => labeledRunners.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodeSecurityUpdateEnterpriseConfigurationRequestDependencyGraphAutosubmitActionOptions &&
        labeledRunners == other.labeledRunners;
  }
}
