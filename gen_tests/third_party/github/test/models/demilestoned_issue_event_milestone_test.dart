// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DemilestonedIssueEventMilestone', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DemilestonedIssueEventMilestone(title: 'example');
      final parsed = DemilestonedIssueEventMilestone.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DemilestonedIssueEventMilestone.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            DemilestonedIssueEventMilestone.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
