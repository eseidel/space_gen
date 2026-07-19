// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf0Conclusion', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksUpdateRequestAnyOf0Conclusion.actionRequired;
      final parsed = ChecksUpdateRequestAnyOf0Conclusion.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksUpdateRequestAnyOf0Conclusion.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksUpdateRequestAnyOf0Conclusion.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChecksUpdateRequestAnyOf0Conclusion.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChecksUpdateRequestAnyOf0Conclusion.values) {
        expect(
          ChecksUpdateRequestAnyOf0Conclusion.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
