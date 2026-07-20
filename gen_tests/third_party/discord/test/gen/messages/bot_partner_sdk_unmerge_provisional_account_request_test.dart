// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BotPartnerSdkUnmergeProvisionalAccountRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BotPartnerSdkUnmergeProvisionalAccountRequest(
        externalUserId: 'example',
      );
      final parsed =
          BotPartnerSdkUnmergeProvisionalAccountRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        BotPartnerSdkUnmergeProvisionalAccountRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BotPartnerSdkUnmergeProvisionalAccountRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
