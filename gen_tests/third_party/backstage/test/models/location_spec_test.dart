// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('LocationSpec', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LocationSpec(target: 'example', type: 'example');
      final parsed = LocationSpec.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LocationSpec.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LocationSpec.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
