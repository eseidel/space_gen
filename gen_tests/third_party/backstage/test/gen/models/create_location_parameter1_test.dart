// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateLocationParameter1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateLocationParameter1.refresh;
      final parsed = CreateLocationParameter1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateLocationParameter1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateLocationParameter1.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CreateLocationParameter1.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CreateLocationParameter1.values) {
        expect(
          CreateLocationParameter1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
