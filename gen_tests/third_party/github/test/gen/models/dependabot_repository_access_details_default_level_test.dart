// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotRepositoryAccessDetailsDefaultLevel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotRepositoryAccessDetailsDefaultLevel.public;
      final parsed =
          DependabotRepositoryAccessDetailsDefaultLevel.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotRepositoryAccessDetailsDefaultLevel.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotRepositoryAccessDetailsDefaultLevel.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in DependabotRepositoryAccessDetailsDefaultLevel.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in DependabotRepositoryAccessDetailsDefaultLevel.values) {
        expect(
          DependabotRepositoryAccessDetailsDefaultLevel.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
