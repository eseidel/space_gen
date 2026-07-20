// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CampaignsUpdateCampaignRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CampaignsUpdateCampaignRequest();
      final parsed = CampaignsUpdateCampaignRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CampaignsUpdateCampaignRequest.maybeFromJson(null), isNull);
    });
  });
}
