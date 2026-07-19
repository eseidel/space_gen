// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CampaignsCreateCampaignRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CampaignsCreateCampaignRequest(
        name: 'example',
        description: 'example',
        endsAt: DateTime.utc(2024),
        codeScanningAlerts:
            const <CampaignsCreateCampaignRequestCodeScanningAlertsInner>[
              CampaignsCreateCampaignRequestCodeScanningAlertsInner(
                repositoryId: 0,
                alertNumbers: <int>[0],
              ),
            ],
      );
      final parsed = CampaignsCreateCampaignRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CampaignsCreateCampaignRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CampaignsCreateCampaignRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
