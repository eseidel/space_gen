// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationSecretScanningAlert', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationSecretScanningAlert();
      final parsed = OrganizationSecretScanningAlert.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationSecretScanningAlert.maybeFromJson(null), isNull);
    });
  });
}
