// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForTeamDiscussionInOrgParameter3', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForTeamDiscussionInOrgParameter3.plus1;
      final parsed =
          ReactionsListForTeamDiscussionInOrgParameter3.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForTeamDiscussionInOrgParameter3.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForTeamDiscussionInOrgParameter3.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForTeamDiscussionInOrgParameter3.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForTeamDiscussionInOrgParameter3.values) {
        expect(
          ReactionsListForTeamDiscussionInOrgParameter3.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
