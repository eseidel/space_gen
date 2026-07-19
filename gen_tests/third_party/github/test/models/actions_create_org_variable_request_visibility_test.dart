// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateOrgVariableRequestVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCreateOrgVariableRequestVisibility.all;
      final parsed = ActionsCreateOrgVariableRequestVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsCreateOrgVariableRequestVisibility.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateOrgVariableRequestVisibility.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ActionsCreateOrgVariableRequestVisibility.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ActionsCreateOrgVariableRequestVisibility.values) {
        expect(
          ActionsCreateOrgVariableRequestVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
