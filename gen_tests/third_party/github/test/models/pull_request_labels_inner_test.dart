// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestLabelsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestLabelsInner(
        id: 0,
        nodeId: 'example',
        url: 'example',
        name: 'example',
        description: 'example',
        color: 'example',
        default_: false,
      );
      final parsed = PullRequestLabelsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestLabelsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestLabelsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
