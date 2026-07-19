// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CvssSeveritiesCvssV4', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CvssSeveritiesCvssV4(vectorString: 'example', score: 0);
      final parsed = CvssSeveritiesCvssV4.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CvssSeveritiesCvssV4.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CvssSeveritiesCvssV4.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
