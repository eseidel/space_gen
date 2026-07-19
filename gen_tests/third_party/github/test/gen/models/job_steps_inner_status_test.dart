// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('JobStepsInnerStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = JobStepsInnerStatus.queued;
      final parsed = JobStepsInnerStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(JobStepsInnerStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => JobStepsInnerStatus.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in JobStepsInnerStatus.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in JobStepsInnerStatus.values) {
        expect(JobStepsInnerStatus.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
