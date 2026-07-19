// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateInOrgRequestVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateInOrgRequestVisibility.public;
      final parsed = ReposCreateInOrgRequestVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateInOrgRequestVisibility.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateInOrgRequestVisibility.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposCreateInOrgRequestVisibility.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposCreateInOrgRequestVisibility.values) {
        expect(
          ReposCreateInOrgRequestVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
