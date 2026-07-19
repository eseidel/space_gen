// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForTeamDiscussionInOrgRequestContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ReactionsCreateForTeamDiscussionInOrgRequestContent.plus1;
      final parsed =
          ReactionsCreateForTeamDiscussionInOrgRequestContent.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForTeamDiscussionInOrgRequestContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForTeamDiscussionInOrgRequestContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsCreateForTeamDiscussionInOrgRequestContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsCreateForTeamDiscussionInOrgRequestContent.values) {
        expect(
          ReactionsCreateForTeamDiscussionInOrgRequestContent.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
