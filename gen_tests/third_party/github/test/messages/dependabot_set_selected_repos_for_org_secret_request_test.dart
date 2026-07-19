// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotSetSelectedReposForOrgSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotSetSelectedReposForOrgSecretRequest(
        selectedRepositoryIds: <int>[0],
      );
      final parsed =
          DependabotSetSelectedReposForOrgSecretRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotSetSelectedReposForOrgSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotSetSelectedReposForOrgSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
