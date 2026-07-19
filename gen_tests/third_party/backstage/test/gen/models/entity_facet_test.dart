// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityFacet', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityFacet(value: 'example', count: 0);
      final parsed = EntityFacet.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityFacet.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityFacet.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
