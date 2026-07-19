// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetSelectedReposForOrgSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetSelectedReposForOrgSecretRequest(
        selectedRepositoryIds: <int>[0],
      );
      final parsed = ActionsSetSelectedReposForOrgSecretRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetSelectedReposForOrgSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsSetSelectedReposForOrgSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
