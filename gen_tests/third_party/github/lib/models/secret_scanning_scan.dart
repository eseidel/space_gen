import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_scan}
/// Information on a single scan performed by secret scanning on the repository
/// {@endtemplate}
@immutable
class SecretScanningScan {
  /// {@macro secret_scanning_scan}
  const SecretScanningScan({
    this.type,
    this.status,
    this.completedAt,
    this.startedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [SecretScanningScan].
  factory SecretScanningScan.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningScan',
      json,
      () => SecretScanningScan(
        type: json['type'] as String?,
        status: json['status'] as String?,
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        startedAt: maybeParseDateTime(json['started_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningScan? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningScan.fromJson(json);
  }

  /// The type of scan
  final String? type;

  /// The state of the scan. Either "completed", "running", or "pending"
  final String? status;

  /// The time that the scan was completed. Empty if the scan is running
  final DateTime? completedAt;

  /// The time that the scan was started. Empty if the scan is pending
  final DateTime? startedAt;

  /// Converts a [SecretScanningScan] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': ?type,
      'status': ?status,
      'completed_at': completedAt?.toIso8601String(),
      'started_at': startedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([type, status, completedAt, startedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningScan &&
        type == other.type &&
        status == other.status &&
        completedAt == other.completedAt &&
        startedAt == other.startedAt;
  }
}
