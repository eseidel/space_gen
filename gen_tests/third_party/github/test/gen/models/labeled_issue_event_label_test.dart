// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LabeledIssueEventLabel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LabeledIssueEventLabel(
        name: 'example',
        color: 'example',
      );
      final parsed = LabeledIssueEventLabel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LabeledIssueEventLabel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LabeledIssueEventLabel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
