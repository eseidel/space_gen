// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Manifest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Manifest(name: 'package-lock.json');
      final parsed = Manifest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Manifest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Manifest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
