// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_security_create_configuration_for_enterprise_request_dependency_graph_autosubmit_action_options}
/// Feature options for Automatic dependency submission
/// {@endtemplate}
@immutable
class CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions {
  /// {@macro code_security_create_configuration_for_enterprise_request_dependency_graph_autosubmit_action_options}
  const CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions({
    this.labeledRunners = false,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions].
  factory CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions',
      json,
      () =>
          CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions(
            labeledRunners: (json['labeled_runners'] as bool?) ?? false,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions.fromJson(
      json,
    );
  }

  /// Whether to use runners labeled with 'dependency-submission' or standard
  /// GitHub runners.
  final bool? labeledRunners;

  /// Converts a [CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'labeled_runners': labeledRunners};
  }

  @override
  int get hashCode => labeledRunners.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions &&
        labeledRunners == other.labeledRunners;
  }
}
