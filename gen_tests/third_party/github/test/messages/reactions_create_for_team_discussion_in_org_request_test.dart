// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForTeamDiscussionInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForTeamDiscussionInOrgRequest(
        content: ReactionsCreateForTeamDiscussionInOrgRequestContent.plus1,
      );
      final parsed = ReactionsCreateForTeamDiscussionInOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForTeamDiscussionInOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForTeamDiscussionInOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
