// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/secret_scanning_scan.dart';
import 'package:github/models/secret_scanning_scan_history_custom_pattern_backfill_scans_inner.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningScanHistory {
  const SecretScanningScanHistory({
    this.incrementalScans,
    this.patternUpdateScans,
    this.backfillScans,
    this.customPatternBackfillScans,
  });

  /// Converts a `Map<String, dynamic>` to a [SecretScanningScanHistory].
  factory SecretScanningScanHistory.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningScanHistory',
      json,
      () => SecretScanningScanHistory(
        incrementalScans: (json['incremental_scans'] as List?)
            ?.map<SecretScanningScan>(
              (e) => SecretScanningScan.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        patternUpdateScans: (json['pattern_update_scans'] as List?)
            ?.map<SecretScanningScan>(
              (e) => SecretScanningScan.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        backfillScans: (json['backfill_scans'] as List?)
            ?.map<SecretScanningScan>(
              (e) => SecretScanningScan.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        customPatternBackfillScans: (json['custom_pattern_backfill_scans'] as List?)
            ?.map<SecretScanningScanHistoryCustomPatternBackfillScansInner>(
              (e) =>
                  SecretScanningScanHistoryCustomPatternBackfillScansInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningScanHistory? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningScanHistory.fromJson(json);
  }

  final List<SecretScanningScan>? incrementalScans;
  final List<SecretScanningScan>? patternUpdateScans;
  final List<SecretScanningScan>? backfillScans;
  final List<SecretScanningScanHistoryCustomPatternBackfillScansInner>?
  customPatternBackfillScans;

  /// Converts a [SecretScanningScanHistory] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'incremental_scans': incrementalScans?.map((e) => e.toJson()).toList(),
      'pattern_update_scans': patternUpdateScans
          ?.map((e) => e.toJson())
          .toList(),
      'backfill_scans': backfillScans?.map((e) => e.toJson()).toList(),
      'custom_pattern_backfill_scans': customPatternBackfillScans
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(incrementalScans),
    listHash(patternUpdateScans),
    listHash(backfillScans),
    listHash(customPatternBackfillScans),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningScanHistory &&
        listsEqual(incrementalScans, other.incrementalScans) &&
        listsEqual(patternUpdateScans, other.patternUpdateScans) &&
        listsEqual(backfillScans, other.backfillScans) &&
        listsEqual(
          customPatternBackfillScans,
          other.customPatternBackfillScans,
        );
  }
}
