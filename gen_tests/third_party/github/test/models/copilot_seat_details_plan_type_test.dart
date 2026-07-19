// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotSeatDetailsPlanType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotSeatDetailsPlanType.business;
      final parsed = CopilotSeatDetailsPlanType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotSeatDetailsPlanType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CopilotSeatDetailsPlanType.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CopilotSeatDetailsPlanType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CopilotSeatDetailsPlanType.values) {
        expect(
          CopilotSeatDetailsPlanType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
