// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsCreateDiscussionInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsCreateDiscussionInOrgRequest(
        title: 'example',
        body: 'example',
      );
      final parsed = TeamsCreateDiscussionInOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamsCreateDiscussionInOrgRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsCreateDiscussionInOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
