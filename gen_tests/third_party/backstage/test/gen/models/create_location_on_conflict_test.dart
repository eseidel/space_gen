// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateLocationOnConflict', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateLocationOnConflict.refresh;
      final parsed = CreateLocationOnConflict.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateLocationOnConflict.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateLocationOnConflict.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CreateLocationOnConflict.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CreateLocationOnConflict.values) {
        expect(
          CreateLocationOnConflict.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
