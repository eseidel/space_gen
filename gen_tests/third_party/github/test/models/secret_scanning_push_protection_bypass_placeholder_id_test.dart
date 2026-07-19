// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningPushProtectionBypassPlaceholderId', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningPushProtectionBypassPlaceholderId(
        'example',
      );
      final parsed =
          SecretScanningPushProtectionBypassPlaceholderId.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecretScanningPushProtectionBypassPlaceholderId.maybeFromJson(null),
        isNull,
      );
    });
  });
}
