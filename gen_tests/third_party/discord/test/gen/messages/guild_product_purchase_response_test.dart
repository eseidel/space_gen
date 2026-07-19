// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildProductPurchaseResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildProductPurchaseResponse(
        listingId: SnowflakeType('0'),
        productName: 'example',
      );
      final parsed = GuildProductPurchaseResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildProductPurchaseResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildProductPurchaseResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
