// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListForAuthenticatedUserParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposListForAuthenticatedUserParameter2.all;
      final parsed = ReposListForAuthenticatedUserParameter2.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposListForAuthenticatedUserParameter2.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposListForAuthenticatedUserParameter2.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposListForAuthenticatedUserParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposListForAuthenticatedUserParameter2.values) {
        expect(
          ReposListForAuthenticatedUserParameter2.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
