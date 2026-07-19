// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_configuration.dart';
import 'package:github/models/code_security_default_configurations_inner_default_for_new_repos.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityDefaultConfigurationsInner {
  const CodeSecurityDefaultConfigurationsInner({
    this.defaultForNewRepos,
    this.configuration,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityDefaultConfigurationsInner].
  factory CodeSecurityDefaultConfigurationsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityDefaultConfigurationsInner',
      json,
      () => CodeSecurityDefaultConfigurationsInner(
        defaultForNewRepos:
            CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos.maybeFromJson(
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
  static CodeSecurityDefaultConfigurationsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityDefaultConfigurationsInner.fromJson(json);
  }

  /// The visibility of newly created repositories for which the code security
  /// configuration will be applied to by default
  final CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos?
  defaultForNewRepos;

  /// A code security configuration
  final CodeSecurityConfiguration? configuration;

  /// Converts a [CodeSecurityDefaultConfigurationsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'default_for_new_repos': defaultForNewRepos?.toJson(),
      'configuration': configuration?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([defaultForNewRepos, configuration]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityDefaultConfigurationsInner &&
        defaultForNewRepos == other.defaultForNewRepos &&
        configuration == other.configuration;
  }
}
