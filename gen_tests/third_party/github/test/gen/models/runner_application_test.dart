// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RunnerApplication', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RunnerApplication(
        os: 'example',
        architecture: 'example',
        downloadUrl: 'example',
        filename: 'example',
      );
      final parsed = RunnerApplication.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RunnerApplication.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RunnerApplication.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
