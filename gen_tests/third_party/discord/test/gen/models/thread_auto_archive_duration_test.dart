// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadAutoArchiveDuration', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ThreadAutoArchiveDuration.oneHour;
      final parsed = ThreadAutoArchiveDuration.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadAutoArchiveDuration.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadAutoArchiveDuration.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ThreadAutoArchiveDuration.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ThreadAutoArchiveDuration.values) {
        expect(
          ThreadAutoArchiveDuration.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
