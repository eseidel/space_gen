// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('LocationInput', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LocationInput(type: 'example', target: 'example');
      final parsed = LocationInput.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LocationInput.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LocationInput.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
