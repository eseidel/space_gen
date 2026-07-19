// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StageInstancesPrivacyLevels', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = StageInstancesPrivacyLevels.public;
      final parsed = StageInstancesPrivacyLevels.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StageInstancesPrivacyLevels.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StageInstancesPrivacyLevels.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in StageInstancesPrivacyLevels.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in StageInstancesPrivacyLevels.values) {
        expect(
          StageInstancesPrivacyLevels.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
