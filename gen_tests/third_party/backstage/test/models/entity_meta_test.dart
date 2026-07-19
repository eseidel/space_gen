// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityMeta', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityMeta(
        name: 'example',
        entries: <String, dynamic>{},
      );
      final parsed = EntityMeta.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityMeta.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityMeta.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
