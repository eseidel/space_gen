// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForTeamDiscussionInOrgContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForTeamDiscussionInOrgContent.plus1;
      final parsed = ReactionsListForTeamDiscussionInOrgContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForTeamDiscussionInOrgContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForTeamDiscussionInOrgContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsListForTeamDiscussionInOrgContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsListForTeamDiscussionInOrgContent.values) {
        expect(
          ReactionsListForTeamDiscussionInOrgContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
