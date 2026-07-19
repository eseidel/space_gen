// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesSetSelectedReposForOrgSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesSetSelectedReposForOrgSecretRequest(
        selectedRepositoryIds: <int>[0],
      );
      final parsed =
          CodespacesSetSelectedReposForOrgSecretRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesSetSelectedReposForOrgSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesSetSelectedReposForOrgSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
