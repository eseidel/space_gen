// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunnerImage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunnerImage(
        id: 'ubuntu-20.04',
        platform: 'linux-x64',
        sizeGb: 86,
        displayName: 'example',
        source: ActionsHostedRunnerImageSource.github,
      );
      final parsed = ActionsHostedRunnerImage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunnerImage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunnerImage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
