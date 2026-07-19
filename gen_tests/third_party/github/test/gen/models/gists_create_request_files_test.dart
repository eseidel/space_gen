// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistsCreateRequestFiles', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistsCreateRequestFiles(content: 'example');
      final parsed = GistsCreateRequestFiles.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistsCreateRequestFiles.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GistsCreateRequestFiles.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
