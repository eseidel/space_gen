// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueEventMilestone', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueEventMilestone(title: 'example');
      final parsed = IssueEventMilestone.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueEventMilestone.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueEventMilestone.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
