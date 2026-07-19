// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TargetUsersJobStatusTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TargetUsersJobStatusTypes.unspecified;
      final parsed = TargetUsersJobStatusTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TargetUsersJobStatusTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TargetUsersJobStatusTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TargetUsersJobStatusTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TargetUsersJobStatusTypes.values) {
        expect(
          TargetUsersJobStatusTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
