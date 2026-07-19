// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CampaignsCreateCampaignRequestCodeScanningAlertsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CampaignsCreateCampaignRequestCodeScanningAlertsInner(
        repositoryId: 0,
        alertNumbers: <int>[0],
      );
      final parsed =
          CampaignsCreateCampaignRequestCodeScanningAlertsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CampaignsCreateCampaignRequestCodeScanningAlertsInner.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CampaignsCreateCampaignRequestCodeScanningAlertsInner.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
