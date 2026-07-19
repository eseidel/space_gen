// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListRepoWorkflows200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListRepoWorkflows200Response(
        totalCount: 0,
        workflows: <Workflow>[
          Workflow(
            id: 5,
            nodeId: 'MDg6V29ya2Zsb3cxMg==',
            name: 'CI',
            path: 'ruby.yaml',
            state: WorkflowState.active,
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            url: 'https://api.github.com/repos/actions/setup-ruby/workflows/5',
            htmlUrl:
                'https://github.com/actions/setup-ruby/blob/master/.github/workflows/ruby.yaml',
            badgeUrl:
                'https://github.com/actions/setup-ruby/workflows/CI/badge.svg',
          ),
        ],
      );
      final parsed = ActionsListRepoWorkflows200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsListRepoWorkflows200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListRepoWorkflows200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
