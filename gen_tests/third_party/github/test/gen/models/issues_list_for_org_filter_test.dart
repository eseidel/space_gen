// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesListForOrgFilter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesListForOrgFilter.assigned;
      final parsed = IssuesListForOrgFilter.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesListForOrgFilter.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesListForOrgFilter.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IssuesListForOrgFilter.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IssuesListForOrgFilter.values) {
        expect(IssuesListForOrgFilter.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
