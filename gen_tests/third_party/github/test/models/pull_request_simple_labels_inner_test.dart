// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestSimpleLabelsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestSimpleLabelsInner(
        id: 0,
        nodeId: 'example',
        url: 'example',
        name: 'example',
        description: 'example',
        color: 'example',
        default_: false,
      );
      final parsed = PullRequestSimpleLabelsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestSimpleLabelsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestSimpleLabelsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
