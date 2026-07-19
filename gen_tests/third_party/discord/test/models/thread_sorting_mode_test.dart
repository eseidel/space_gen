// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadSortingMode', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ThreadSortingMode.relevance;
      final parsed = ThreadSortingMode.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadSortingMode.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadSortingMode.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ThreadSortingMode.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ThreadSortingMode.values) {
        expect(ThreadSortingMode.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
