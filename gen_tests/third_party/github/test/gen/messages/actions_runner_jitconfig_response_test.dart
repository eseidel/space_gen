// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsRunnerJitconfigResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsRunnerJitconfigResponse(
        runner: Runner(
          id: 5,
          name: 'iMac',
          os: 'macos',
          status: 'online',
          busy: false,
          labels: <RunnerLabel>[RunnerLabel(name: 'example')],
        ),
        encodedJitConfig: 'example',
      );
      final parsed = ActionsRunnerJitconfigResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsRunnerJitconfigResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsRunnerJitconfigResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
