// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotSetRepositoryAccessDefaultLevelRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotSetRepositoryAccessDefaultLevelRequest(
        defaultLevel:
            DependabotSetRepositoryAccessDefaultLevelRequestDefaultLevel.public,
      );
      final parsed =
          DependabotSetRepositoryAccessDefaultLevelRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotSetRepositoryAccessDefaultLevelRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotSetRepositoryAccessDefaultLevelRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
