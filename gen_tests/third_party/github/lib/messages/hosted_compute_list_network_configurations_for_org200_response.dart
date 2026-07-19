import 'package:github/model_helpers.dart';
import 'package:github/models/network_configuration.dart';
import 'package:meta/meta.dart';

@immutable
class HostedComputeListNetworkConfigurationsForOrg200Response {
  const HostedComputeListNetworkConfigurationsForOrg200Response({
    required this.totalCount,
    required this.networkConfigurations,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [HostedComputeListNetworkConfigurationsForOrg200Response].
  factory HostedComputeListNetworkConfigurationsForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'HostedComputeListNetworkConfigurationsForOrg200Response',
      json,
      () => HostedComputeListNetworkConfigurationsForOrg200Response(
        totalCount: json['total_count'] as int,
        networkConfigurations: (json['network_configurations'] as List)
            .map<NetworkConfiguration>(
              (e) => NetworkConfiguration.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HostedComputeListNetworkConfigurationsForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return HostedComputeListNetworkConfigurationsForOrg200Response.fromJson(
      json,
    );
  }

  final int totalCount;
  final List<NetworkConfiguration> networkConfigurations;

  /// Converts a [HostedComputeListNetworkConfigurationsForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'network_configurations': networkConfigurations
          .map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, listHash(networkConfigurations)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HostedComputeListNetworkConfigurationsForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(networkConfigurations, other.networkConfigurations);
  }
}
