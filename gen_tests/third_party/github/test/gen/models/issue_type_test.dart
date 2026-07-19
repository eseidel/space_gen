// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueType(
        id: 0,
        nodeId: 'example',
        name: 'example',
        description: 'example',
      );
      final parsed = IssueType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueType.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
