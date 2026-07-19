import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template public_ip}
/// Public IP for a GitHub-hosted larger runners.
/// Provides details of Public IP for a GitHub-hosted larger runners
/// {@endtemplate}
@immutable
class PublicIp {
  /// {@macro public_ip}
  const PublicIp({this.enabled, this.prefix, this.length});

  /// Converts a `Map<String, dynamic>` to a [PublicIp].
  factory PublicIp.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PublicIp',
      json,
      () => PublicIp(
        enabled: json['enabled'] as bool?,
        prefix: json['prefix'] as String?,
        length: json['length'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PublicIp? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PublicIp.fromJson(json);
  }

  /// Whether public IP is enabled.
  /// Example: `true`
  final bool? enabled;

  /// The prefix for the public IP.
  /// Example: `'20.80.208.150'`
  final String? prefix;

  /// The length of the IP prefix.
  /// Example: `28`
  final int? length;

  /// Converts a [PublicIp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (enabled != null) 'enabled': enabled,
      if (prefix != null) 'prefix': prefix,
      if (length != null) 'length': length,
    };
  }

  @override
  int get hashCode => Object.hashAll([enabled, prefix, length]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PublicIp &&
        enabled == other.enabled &&
        prefix == other.prefix &&
        length == other.length;
  }
}
