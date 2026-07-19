import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_o_auth2_install_params.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationIntegrationTypeConfiguration {
  const ApplicationIntegrationTypeConfiguration({this.oauth2InstallParams});

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationIntegrationTypeConfiguration].
  factory ApplicationIntegrationTypeConfiguration.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationIntegrationTypeConfiguration',
      json,
      () => ApplicationIntegrationTypeConfiguration(
        oauth2InstallParams: ApplicationOAuth2InstallParams.maybeFromJson(
          json['oauth2_install_params'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationIntegrationTypeConfiguration? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationIntegrationTypeConfiguration.fromJson(json);
  }

  final ApplicationOAuth2InstallParams? oauth2InstallParams;

  /// Converts an [ApplicationIntegrationTypeConfiguration]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'oauth2_install_params': oauth2InstallParams?.toJson()};
  }

  @override
  int get hashCode => oauth2InstallParams.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationIntegrationTypeConfiguration &&
        oauth2InstallParams == other.oauth2InstallParams;
  }
}
