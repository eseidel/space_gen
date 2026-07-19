// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/hosted_compute_update_network_configuration_for_org_request_compute_service.dart';
import 'package:meta/meta.dart';

@immutable
class HostedComputeUpdateNetworkConfigurationForOrgRequest {
  const HostedComputeUpdateNetworkConfigurationForOrgRequest({
    this.name,
    this.computeService,
    this.networkSettingsIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [HostedComputeUpdateNetworkConfigurationForOrgRequest].
  factory HostedComputeUpdateNetworkConfigurationForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'HostedComputeUpdateNetworkConfigurationForOrgRequest',
      json,
      () => HostedComputeUpdateNetworkConfigurationForOrgRequest(
        name: json['name'] as String?,
        computeService:
            HostedComputeUpdateNetworkConfigurationForOrgRequestComputeService.maybeFromJson(
              json['compute_service'] as String?,
            ),
        networkSettingsIds: (json['network_settings_ids'] as List?)
            ?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HostedComputeUpdateNetworkConfigurationForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return HostedComputeUpdateNetworkConfigurationForOrgRequest.fromJson(json);
  }

  /// Name of the network configuration. Must be between 1 and 100 characters
  /// and may only contain upper and lowercase letters a-z, numbers 0-9, '.',
  /// '-', and '_'.
  final String? name;

  /// The hosted compute service to use for the network configuration.
  final HostedComputeUpdateNetworkConfigurationForOrgRequestComputeService?
  computeService;

  /// The identifier of the network settings to use for the network
  /// configuration. Exactly one network settings must be specified.
  final List<String>? networkSettingsIds;

  /// Converts a [HostedComputeUpdateNetworkConfigurationForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'compute_service': computeService?.toJson(),
      'network_settings_ids': networkSettingsIds,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, computeService, listHash(networkSettingsIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HostedComputeUpdateNetworkConfigurationForOrgRequest &&
        name == other.name &&
        computeService == other.computeService &&
        listsEqual(networkSettingsIds, other.networkSettingsIds);
  }
}
