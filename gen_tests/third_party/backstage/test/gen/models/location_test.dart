// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('Location', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Location(
        target: 'example',
        type: 'example',
        id: 'example',
        entityRef: 'example',
      );
      final parsed = Location.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Location.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Location.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
