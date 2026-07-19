// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamFullPrivacy', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamFullPrivacy.closed;
      final parsed = TeamFullPrivacy.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamFullPrivacy.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamFullPrivacy.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TeamFullPrivacy.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TeamFullPrivacy.values) {
        expect(TeamFullPrivacy.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
