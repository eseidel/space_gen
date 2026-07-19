// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RenamedIssueEventRename', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RenamedIssueEventRename(from: 'example', to: 'example');
      final parsed = RenamedIssueEventRename.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RenamedIssueEventRename.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RenamedIssueEventRename.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
