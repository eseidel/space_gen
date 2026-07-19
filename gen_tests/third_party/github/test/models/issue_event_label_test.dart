// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueEventLabel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueEventLabel(name: 'example', color: 'example');
      final parsed = IssueEventLabel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueEventLabel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueEventLabel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
