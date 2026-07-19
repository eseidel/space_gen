// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForTeamDiscussionLegacyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForTeamDiscussionLegacyRequest(
        content: ReactionsCreateForTeamDiscussionLegacyRequestContent.plus1,
      );
      final parsed =
          ReactionsCreateForTeamDiscussionLegacyRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForTeamDiscussionLegacyRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForTeamDiscussionLegacyRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
