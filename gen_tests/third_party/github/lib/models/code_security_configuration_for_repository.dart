import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_configuration.dart';
import 'package:github/models/code_security_configuration_for_repository_status.dart';
import 'package:meta/meta.dart';

/// {@template code_security_configuration_for_repository}
/// Code security configuration associated with a repository and attachment
/// status
/// {@endtemplate}
@immutable
class CodeSecurityConfigurationForRepository {
  /// {@macro code_security_configuration_for_repository}
  const CodeSecurityConfigurationForRepository({
    this.status,
    this.configuration,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityConfigurationForRepository].
  factory CodeSecurityConfigurationForRepository.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityConfigurationForRepository',
      json,
      () => CodeSecurityConfigurationForRepository(
        status: CodeSecurityConfigurationForRepositoryStatus.maybeFromJson(
          json['status'] as String?,
        ),
        configuration: CodeSecurityConfiguration.maybeFromJson(
          json['configuration'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationForRepository? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationForRepository.fromJson(json);
  }

  /// The attachment status of the code security configuration on the
  /// repository.
  final CodeSecurityConfigurationForRepositoryStatus? status;

  /// A code security configuration
  final CodeSecurityConfiguration? configuration;

  /// Converts a [CodeSecurityConfigurationForRepository]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'status': ?status?.toJson(),
      'configuration': ?configuration?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([status, configuration]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityConfigurationForRepository &&
        status == other.status &&
        configuration == other.configuration;
  }
}
