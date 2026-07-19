// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsCreateDiscussionLegacyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsCreateDiscussionLegacyRequest(
        title: 'example',
        body: 'example',
      );
      final parsed = TeamsCreateDiscussionLegacyRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamsCreateDiscussionLegacyRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsCreateDiscussionLegacyRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
