// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_security_update_configuration_request_dependency_graph_autosubmit_action_options}
/// Feature options for Automatic dependency submission
/// {@endtemplate}
@immutable
class CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions {
  /// {@macro code_security_update_configuration_request_dependency_graph_autosubmit_action_options}
  const CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions({
    this.labeledRunners,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions].
  factory CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions',
      json,
      () =>
          CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions(
            labeledRunners: json['labeled_runners'] as bool?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions.fromJson(
      json,
    );
  }

  /// Whether to use runners labeled with 'dependency-submission' or standard
  /// GitHub runners.
  final bool? labeledRunners;

  /// Converts a [CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions]
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
            is CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions &&
        labeledRunners == other.labeledRunners;
  }
}
