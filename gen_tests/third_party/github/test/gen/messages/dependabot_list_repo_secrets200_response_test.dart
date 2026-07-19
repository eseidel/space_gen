// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotListRepoSecrets200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotListRepoSecrets200Response(
        totalCount: 0,
        secrets: <DependabotSecret>[
          DependabotSecret(
            name: 'MY_ARTIFACTORY_PASSWORD',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed = DependabotListRepoSecrets200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotListRepoSecrets200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotListRepoSecrets200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
