// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('FindPetsByStatusStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FindPetsByStatusStatus.available;
      final parsed = FindPetsByStatusStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FindPetsByStatusStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FindPetsByStatusStatus.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in FindPetsByStatusStatus.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in FindPetsByStatusStatus.values) {
        expect(FindPetsByStatusStatus.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
