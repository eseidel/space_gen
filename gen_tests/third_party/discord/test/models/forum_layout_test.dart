// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ForumLayout', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ForumLayout.default_;
      final parsed = ForumLayout.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ForumLayout.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => ForumLayout.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in ForumLayout.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ForumLayout.values) {
        expect(ForumLayout.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
