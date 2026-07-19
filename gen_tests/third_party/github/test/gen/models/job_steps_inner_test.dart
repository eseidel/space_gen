// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('JobStepsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = JobStepsInner(
        status: JobStepsInnerStatus.queued,
        conclusion: 'success',
        name: 'test-coverage',
        number: 1,
      );
      final parsed = JobStepsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(JobStepsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => JobStepsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
