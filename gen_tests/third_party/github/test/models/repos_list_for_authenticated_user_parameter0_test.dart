// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListForAuthenticatedUserParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposListForAuthenticatedUserParameter0.all;
      final parsed = ReposListForAuthenticatedUserParameter0.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposListForAuthenticatedUserParameter0.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposListForAuthenticatedUserParameter0.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposListForAuthenticatedUserParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposListForAuthenticatedUserParameter0.values) {
        expect(
          ReposListForAuthenticatedUserParameter0.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
