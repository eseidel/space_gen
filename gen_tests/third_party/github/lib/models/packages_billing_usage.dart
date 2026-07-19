import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PackagesBillingUsage {
  const PackagesBillingUsage({
    required this.totalGigabytesBandwidthUsed,
    required this.totalPaidGigabytesBandwidthUsed,
    required this.includedGigabytesBandwidth,
  });

  /// Converts a `Map<String, dynamic>` to a [PackagesBillingUsage].
  factory PackagesBillingUsage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PackagesBillingUsage',
      json,
      () => PackagesBillingUsage(
        totalGigabytesBandwidthUsed:
            json['total_gigabytes_bandwidth_used'] as int,
        totalPaidGigabytesBandwidthUsed:
            json['total_paid_gigabytes_bandwidth_used'] as int,
        includedGigabytesBandwidth: json['included_gigabytes_bandwidth'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PackagesBillingUsage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PackagesBillingUsage.fromJson(json);
  }

  /// Sum of the free and paid storage space (GB) for GitHuub Packages.
  final int totalGigabytesBandwidthUsed;

  /// Total paid storage space (GB) for GitHuub Packages.
  final int totalPaidGigabytesBandwidthUsed;

  /// Free storage space (GB) for GitHub Packages.
  final int includedGigabytesBandwidth;

  /// Converts a [PackagesBillingUsage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_gigabytes_bandwidth_used': totalGigabytesBandwidthUsed,
      'total_paid_gigabytes_bandwidth_used': totalPaidGigabytesBandwidthUsed,
      'included_gigabytes_bandwidth': includedGigabytesBandwidth,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    totalGigabytesBandwidthUsed,
    totalPaidGigabytesBandwidthUsed,
    includedGigabytesBandwidth,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackagesBillingUsage &&
        totalGigabytesBandwidthUsed == other.totalGigabytesBandwidthUsed &&
        totalPaidGigabytesBandwidthUsed ==
            other.totalPaidGigabytesBandwidthUsed &&
        includedGigabytesBandwidth == other.includedGigabytesBandwidth;
  }
}
