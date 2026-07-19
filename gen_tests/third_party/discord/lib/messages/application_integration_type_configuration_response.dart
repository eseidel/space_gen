import 'package:discord/messages/application_o_auth2_install_params_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationIntegrationTypeConfigurationResponse {
  const ApplicationIntegrationTypeConfigurationResponse({
    this.oauth2InstallParams,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationIntegrationTypeConfigurationResponse].
  factory ApplicationIntegrationTypeConfigurationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationIntegrationTypeConfigurationResponse',
      json,
      () => ApplicationIntegrationTypeConfigurationResponse(
        oauth2InstallParams:
            ApplicationOAuth2InstallParamsResponse.maybeFromJson(
              json['oauth2_install_params'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationIntegrationTypeConfigurationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationIntegrationTypeConfigurationResponse.fromJson(json);
  }

  final ApplicationOAuth2InstallParamsResponse? oauth2InstallParams;

  /// Converts an [ApplicationIntegrationTypeConfigurationResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (oauth2InstallParams != null)
        'oauth2_install_params': oauth2InstallParams?.toJson(),
    };
  }

  @override
  int get hashCode => oauth2InstallParams.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationIntegrationTypeConfigurationResponse &&
        oauth2InstallParams == other.oauth2InstallParams;
  }
}
