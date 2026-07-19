// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesListForOrgParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesListForOrgParameter2.open;
      final parsed = IssuesListForOrgParameter2.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesListForOrgParameter2.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            IssuesListForOrgParameter2.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IssuesListForOrgParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IssuesListForOrgParameter2.values) {
        expect(
          IssuesListForOrgParameter2.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
