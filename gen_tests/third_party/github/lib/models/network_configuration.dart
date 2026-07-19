import 'package:github/model_helpers.dart';
import 'package:github/models/network_configuration_compute_service.dart';
import 'package:meta/meta.dart';

/// {@template network_configuration}
/// Hosted compute network configuration
/// A hosted compute network configuration.
/// {@endtemplate}
@immutable
class NetworkConfiguration {
  /// {@macro network_configuration}
  const NetworkConfiguration({
    required this.id,
    required this.name,
    required this.createdOn,
    this.computeService,
    this.networkSettingsIds,
  });

  /// Converts a `Map<String, dynamic>` to a [NetworkConfiguration].
  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NetworkConfiguration',
      json,
      () => NetworkConfiguration(
        id: json['id'] as String,
        name: json['name'] as String,
        computeService: NetworkConfigurationComputeService.maybeFromJson(
          json['compute_service'] as String?,
        ),
        networkSettingsIds: (json['network_settings_ids'] as List?)
            ?.cast<String>(),
        createdOn: maybeParseDateTime(
          checkedKey(json, 'created_on') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NetworkConfiguration? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NetworkConfiguration.fromJson(json);
  }

  /// The unique identifier of the network configuration.
  /// Example: `'123ABC456DEF789'`
  final String id;

  /// The name of the network configuration.
  /// Example: `'my-network-configuration'`
  final String name;

  /// The hosted compute service the network configuration supports.
  final NetworkConfigurationComputeService? computeService;

  /// The unique identifier of each network settings in the configuration.
  /// Example: `'123ABC456DEF789'`
  final List<String>? networkSettingsIds;

  /// The time at which the network configuration was created, in ISO 8601
  /// format.
  /// Example: `'2024-04-26T11:31:07Z'`
  final DateTime? createdOn;

  /// Converts a [NetworkConfiguration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'compute_service': ?computeService?.toJson(),
      'network_settings_ids': ?networkSettingsIds,
      'created_on': createdOn?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    computeService,
    listHash(networkSettingsIds),
    createdOn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NetworkConfiguration &&
        id == other.id &&
        name == other.name &&
        computeService == other.computeService &&
        listsEqual(networkSettingsIds, other.networkSettingsIds) &&
        createdOn == other.createdOn;
  }
}
