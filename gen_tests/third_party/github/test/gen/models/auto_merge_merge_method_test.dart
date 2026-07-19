// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AutoMergeMergeMethod', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AutoMergeMergeMethod.merge;
      final parsed = AutoMergeMergeMethod.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AutoMergeMergeMethod.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AutoMergeMergeMethod.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AutoMergeMergeMethod.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AutoMergeMergeMethod.values) {
        expect(AutoMergeMergeMethod.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
