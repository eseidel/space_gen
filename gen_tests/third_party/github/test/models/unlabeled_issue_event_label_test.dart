// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UnlabeledIssueEventLabel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UnlabeledIssueEventLabel(
        name: 'example',
        color: 'example',
      );
      final parsed = UnlabeledIssueEventLabel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UnlabeledIssueEventLabel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UnlabeledIssueEventLabel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
