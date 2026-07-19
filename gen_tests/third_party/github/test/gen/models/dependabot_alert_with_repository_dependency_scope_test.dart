// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertWithRepositoryDependencyScope', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotAlertWithRepositoryDependencyScope.development;
      final parsed = DependabotAlertWithRepositoryDependencyScope.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotAlertWithRepositoryDependencyScope.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertWithRepositoryDependencyScope.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in DependabotAlertWithRepositoryDependencyScope.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in DependabotAlertWithRepositoryDependencyScope.values) {
        expect(
          DependabotAlertWithRepositoryDependencyScope.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
