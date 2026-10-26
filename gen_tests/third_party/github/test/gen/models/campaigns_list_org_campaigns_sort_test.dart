// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CampaignsListOrgCampaignsSort', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CampaignsListOrgCampaignsSort.created;
      final parsed = CampaignsListOrgCampaignsSort.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CampaignsListOrgCampaignsSort.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CampaignsListOrgCampaignsSort.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CampaignsListOrgCampaignsSort.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CampaignsListOrgCampaignsSort.values) {
        expect(
          CampaignsListOrgCampaignsSort.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
