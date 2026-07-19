// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotOrganizationDetailsPlanType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotOrganizationDetailsPlanType.business;
      final parsed = CopilotOrganizationDetailsPlanType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotOrganizationDetailsPlanType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotOrganizationDetailsPlanType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CopilotOrganizationDetailsPlanType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CopilotOrganizationDetailsPlanType.values) {
        expect(
          CopilotOrganizationDetailsPlanType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
