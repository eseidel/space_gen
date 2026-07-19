// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdatePreferencesRequestVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdatePreferencesRequestVisibility.public;
      final parsed = UpdatePreferencesRequestVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdatePreferencesRequestVisibility.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UpdatePreferencesRequestVisibility.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in UpdatePreferencesRequestVisibility.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in UpdatePreferencesRequestVisibility.values) {
        expect(
          UpdatePreferencesRequestVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
