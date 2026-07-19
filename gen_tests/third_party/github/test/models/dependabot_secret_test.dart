// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotSecret', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotSecret(
        name: 'MY_ARTIFACTORY_PASSWORD',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = DependabotSecret.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotSecret.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotSecret.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
