// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RunnerLabel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RunnerLabel(name: 'example');
      final parsed = RunnerLabel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RunnerLabel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RunnerLabel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
