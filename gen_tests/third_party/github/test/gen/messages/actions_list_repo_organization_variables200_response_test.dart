// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListRepoOrganizationVariables200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListRepoOrganizationVariables200Response(
        totalCount: 0,
        variables: <ActionsVariable>[
          ActionsVariable(
            name: 'USERNAME',
            value: 'octocat',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed =
          ActionsListRepoOrganizationVariables200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListRepoOrganizationVariables200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListRepoOrganizationVariables200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
