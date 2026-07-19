// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetSelectedReposForOrgVariableRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetSelectedReposForOrgVariableRequest(
        selectedRepositoryIds: <int>[0],
      );
      final parsed = ActionsSetSelectedReposForOrgVariableRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetSelectedReposForOrgVariableRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsSetSelectedReposForOrgVariableRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
