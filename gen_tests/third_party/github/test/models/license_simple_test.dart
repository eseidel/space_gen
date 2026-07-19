// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LicenseSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LicenseSimple(
        key: 'mit',
        name: 'MIT License',
        url: Uri.parse('https://example.com'),
        spdxId: 'MIT',
        nodeId: 'MDc6TGljZW5zZW1pdA==',
      );
      final parsed = LicenseSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LicenseSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LicenseSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
