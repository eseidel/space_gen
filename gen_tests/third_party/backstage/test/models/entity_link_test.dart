// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityLink', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityLink(url: 'example');
      final parsed = EntityLink.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityLink.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityLink.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
