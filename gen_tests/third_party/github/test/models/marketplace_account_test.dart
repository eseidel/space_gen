// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketplaceAccount', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MarketplaceAccount(
        url: Uri.parse('https://example.com'),
        id: 0,
        type: 'example',
        login: 'example',
      );
      final parsed = MarketplaceAccount.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketplaceAccount.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketplaceAccount.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
