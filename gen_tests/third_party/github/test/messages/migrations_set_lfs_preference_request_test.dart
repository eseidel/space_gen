// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsSetLfsPreferenceRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsSetLfsPreferenceRequest(
        useLfs: MigrationsSetLfsPreferenceRequestUseLfs.optIn,
      );
      final parsed = MigrationsSetLfsPreferenceRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MigrationsSetLfsPreferenceRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsSetLfsPreferenceRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
