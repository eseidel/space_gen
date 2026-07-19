// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('FindPetsByStatusParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FindPetsByStatusParameter0.available;
      final parsed = FindPetsByStatusParameter0.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FindPetsByStatusParameter0.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            FindPetsByStatusParameter0.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in FindPetsByStatusParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in FindPetsByStatusParameter0.values) {
        expect(
          FindPetsByStatusParameter0.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
