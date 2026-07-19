// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadSortOrder', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ThreadSortOrder.latestActivity;
      final parsed = ThreadSortOrder.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadSortOrder.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => ThreadSortOrder.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in ThreadSortOrder.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ThreadSortOrder.values) {
        expect(ThreadSortOrder.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
