// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Runner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Runner(
        id: 5,
        name: 'iMac',
        os: 'macos',
        status: 'online',
        busy: false,
        labels: <RunnerLabel>[RunnerLabel(name: 'example')],
      );
      final parsed = Runner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Runner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Runner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
