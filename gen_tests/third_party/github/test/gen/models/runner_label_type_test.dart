// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RunnerLabelType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RunnerLabelType.readOnly;
      final parsed = RunnerLabelType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RunnerLabelType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RunnerLabelType.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RunnerLabelType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RunnerLabelType.values) {
        expect(RunnerLabelType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
