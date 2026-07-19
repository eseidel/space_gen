// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningCreatePushProtectionBypassRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningCreatePushProtectionBypassRequest(
        reason: SecretScanningPushProtectionBypassReason.falsePositive,
        placeholderId: SecretScanningPushProtectionBypassPlaceholderId(
          'example',
        ),
      );
      final parsed =
          SecretScanningCreatePushProtectionBypassRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecretScanningCreatePushProtectionBypassRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningCreatePushProtectionBypassRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
