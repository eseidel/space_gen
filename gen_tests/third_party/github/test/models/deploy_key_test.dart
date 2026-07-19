// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeployKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DeployKey(
        id: 0,
        key: 'example',
        url: 'example',
        title: 'example',
        verified: false,
        createdAt: 'example',
        readOnly: false,
      );
      final parsed = DeployKey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeployKey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeployKey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
