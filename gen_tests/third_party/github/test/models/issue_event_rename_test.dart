// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueEventRename', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueEventRename(from: 'example', to: 'example');
      final parsed = IssueEventRename.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueEventRename.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueEventRename.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
