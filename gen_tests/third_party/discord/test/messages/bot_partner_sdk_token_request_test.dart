// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BotPartnerSdkTokenRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BotPartnerSdkTokenRequest(externalUserId: 'example');
      final parsed = BotPartnerSdkTokenRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BotPartnerSdkTokenRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BotPartnerSdkTokenRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
