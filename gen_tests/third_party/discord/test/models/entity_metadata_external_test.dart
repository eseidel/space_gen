// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityMetadataExternal', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityMetadataExternal(location: 'example');
      final parsed = EntityMetadataExternal.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityMetadataExternal.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityMetadataExternal.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
