// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('VideoQualityModes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = VideoQualityModes.auto;
      final parsed = VideoQualityModes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(VideoQualityModes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => VideoQualityModes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in VideoQualityModes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in VideoQualityModes.values) {
        expect(VideoQualityModes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
