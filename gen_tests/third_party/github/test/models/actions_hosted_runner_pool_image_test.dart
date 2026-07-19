// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunnerPoolImage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunnerPoolImage(
        id: 'ubuntu-20.04',
        sizeGb: 86,
        displayName: 'example',
        source: ActionsHostedRunnerPoolImageSource.github,
      );
      final parsed = ActionsHostedRunnerPoolImage.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunnerPoolImage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunnerPoolImage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
