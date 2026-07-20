// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SocialLayerSkuPurchaseEligibilityCallbackData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SocialLayerSkuPurchaseEligibilityCallbackData(
        eligible: false,
      );
      final parsed =
          SocialLayerSkuPurchaseEligibilityCallbackData.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SocialLayerSkuPurchaseEligibilityCallbackData.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SocialLayerSkuPurchaseEligibilityCallbackData.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
