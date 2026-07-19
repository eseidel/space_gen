// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationUpdateIssueTypeColor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationUpdateIssueTypeColor.gray;
      final parsed = OrganizationUpdateIssueTypeColor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationUpdateIssueTypeColor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationUpdateIssueTypeColor.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OrganizationUpdateIssueTypeColor.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OrganizationUpdateIssueTypeColor.values) {
        expect(
          OrganizationUpdateIssueTypeColor.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
