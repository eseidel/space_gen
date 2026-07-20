import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template install_mount_request}
/// Install Mount Request
/// {@endtemplate}
@immutable
class InstallMountRequest {
  /// {@macro install_mount_request}
  InstallMountRequest({required this.symbol}) {
    symbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to an [InstallMountRequest].
  factory InstallMountRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallMountRequest',
      json,
      () => InstallMountRequest(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallMountRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallMountRequest.fromJson(json);
  }

  /// The symbol of the mount to install.
  final String symbol;

  /// Converts an [InstallMountRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallMountRequest && symbol == other.symbol;
  }
}
