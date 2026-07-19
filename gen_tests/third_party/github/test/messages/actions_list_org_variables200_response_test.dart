// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListOrgVariables200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListOrgVariables200Response(
        totalCount: 0,
        variables: <OrganizationActionsVariable>[
          OrganizationActionsVariable(
            name: 'USERNAME',
            value: 'octocat',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            visibility: OrganizationActionsVariableVisibility.all,
          ),
        ],
      );
      final parsed = ActionsListOrgVariables200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsListOrgVariables200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListOrgVariables200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
