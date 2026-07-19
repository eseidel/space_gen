// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('NullableEntityAnyOf0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = NullableEntityAnyOf0(
        metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
        kind: 'example',
        apiVersion: 'example',
      );
      final parsed = NullableEntityAnyOf0.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NullableEntityAnyOf0.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NullableEntityAnyOf0.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
