// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CampaignSummaryAlertStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CampaignSummaryAlertStats(
        openCount: 0,
        closedCount: 0,
        inProgressCount: 0,
      );
      final parsed = CampaignSummaryAlertStats.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CampaignSummaryAlertStats.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CampaignSummaryAlertStats.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
