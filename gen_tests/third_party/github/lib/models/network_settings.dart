// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template network_settings}
/// Hosted compute network settings resource
/// A hosted compute network settings resource.
/// {@endtemplate}
@immutable
class NetworkSettings {
  /// {@macro network_settings}
  const NetworkSettings({
    required this.id,
    required this.name,
    required this.subnetId,
    required this.region,
    this.networkConfigurationId,
  });

  /// Converts a `Map<String, dynamic>` to a [NetworkSettings].
  factory NetworkSettings.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NetworkSettings',
      json,
      () => NetworkSettings(
        id: json['id'] as String,
        networkConfigurationId: json['network_configuration_id'] as String?,
        name: json['name'] as String,
        subnetId: json['subnet_id'] as String,
        region: json['region'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NetworkSettings? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NetworkSettings.fromJson(json);
  }

  /// The unique identifier of the network settings resource.
  /// Example: `'220F78DACB92BBFBC5E6F22DE1CCF52309D'`
  final String id;

  /// The identifier of the network configuration that is using this settings
  /// resource.
  /// Example: `'934E208B3EE0BD60CF5F752C426BFB53562'`
  final String? networkConfigurationId;

  /// The name of the network settings resource.
  /// Example: `'my-network-settings'`
  final String name;

  /// The subnet this network settings resource is configured for.
  /// Example:
  /// `'/subscriptions/14839728-3ad9-43ab-bd2b-fa6ad0f75e2a/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet'`
  final String subnetId;

  /// The location of the subnet this network settings resource is configured
  /// for.
  /// Example: `'eastus'`
  final String region;

  /// Converts a [NetworkSettings] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'network_configuration_id': networkConfigurationId,
      'name': name,
      'subnet_id': subnetId,
      'region': region,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, networkConfigurationId, name, subnetId, region]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NetworkSettings &&
        id == other.id &&
        networkConfigurationId == other.networkConfigurationId &&
        name == other.name &&
        subnetId == other.subnetId &&
        region == other.region;
  }
}
