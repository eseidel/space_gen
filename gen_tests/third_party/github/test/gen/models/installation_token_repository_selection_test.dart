// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InstallationTokenRepositorySelection', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InstallationTokenRepositorySelection.all;
      final parsed = InstallationTokenRepositorySelection.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InstallationTokenRepositorySelection.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InstallationTokenRepositorySelection.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in InstallationTokenRepositorySelection.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in InstallationTokenRepositorySelection.values) {
        expect(
          InstallationTokenRepositorySelection.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
