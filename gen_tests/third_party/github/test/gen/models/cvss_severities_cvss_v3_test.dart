// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CvssSeveritiesCvssV3', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CvssSeveritiesCvssV3(vectorString: 'example', score: 0);
      final parsed = CvssSeveritiesCvssV3.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CvssSeveritiesCvssV3.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CvssSeveritiesCvssV3.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
