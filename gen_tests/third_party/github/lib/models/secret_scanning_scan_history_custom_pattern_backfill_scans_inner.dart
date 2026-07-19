import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningScanHistoryCustomPatternBackfillScansInner {
  const SecretScanningScanHistoryCustomPatternBackfillScansInner({
    this.type,
    this.status,
    this.completedAt,
    this.startedAt,
    this.patternName,
    this.patternScope,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningScanHistoryCustomPatternBackfillScansInner].
  factory SecretScanningScanHistoryCustomPatternBackfillScansInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningScanHistoryCustomPatternBackfillScansInner',
      json,
      () => SecretScanningScanHistoryCustomPatternBackfillScansInner(
        type: json['type'] as String?,
        status: json['status'] as String?,
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        patternName: json['pattern_name'] as String?,
        patternScope: json['pattern_scope'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningScanHistoryCustomPatternBackfillScansInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningScanHistoryCustomPatternBackfillScansInner.fromJson(
      json,
    );
  }

  /// The type of scan
  final String? type;

  /// The state of the scan. Either "completed", "running", or "pending"
  final String? status;

  /// The time that the scan was completed. Empty if the scan is running
  final DateTime? completedAt;

  /// The time that the scan was started. Empty if the scan is pending
  final DateTime? startedAt;

  /// Name of the custom pattern for custom pattern scans
  final String? patternName;

  /// Level at which the custom pattern is defined, one of "repository",
  /// "organization", or "enterprise"
  final String? patternScope;

  /// Converts a [SecretScanningScanHistoryCustomPatternBackfillScansInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      'completed_at': completedAt?.toIso8601String(),
      'started_at': startedAt?.toIso8601String(),
      if (patternName != null) 'pattern_name': patternName,
      if (patternScope != null) 'pattern_scope': patternScope,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    status,
    completedAt,
    startedAt,
    patternName,
    patternScope,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningScanHistoryCustomPatternBackfillScansInner &&
        type == other.type &&
        status == other.status &&
        completedAt == other.completedAt &&
        startedAt == other.startedAt &&
        patternName == other.patternName &&
        patternScope == other.patternScope;
  }
}
